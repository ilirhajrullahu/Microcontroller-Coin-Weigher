 
#include "../h/pmc.h"
#include "../h/pio.h"
#include "../h/aic.h"
//Für die waage
#include "../h/tc.h"

#define TC4_INIT  TC_CLKS_MCK2 | TC_LDBSTOP | TC_CAPT | TC_LDRA_RISING_EDGE | TC_LDRB_RISING_EDGE
#define TC5_INIT  TC_CLKS_MCK2 | TC_LDBSTOP | TC_CAPT | TC_LDRA_RISING_EDGE | TC_LDRB_RISING_EDGE
#define C1 18030 // globale konstante abhängig von der waage
#define C2 40 // globale konstante abhängig von der waage
StructTC* tcbase4 = TCB4_BASE;
StructTC* tcbase5 = TCB5_BASE;

int COINWEIGHT = 574; // CHANGE THIS (gr)
int AVERAGECOUNT =100;

int TARE = 0; // toggle if tare has been done
int WEIGHING = 0; // toggle if weighing process is has begun
int OUTPUT = 0; // toggle if output has been done

int TAREWEIGHT = 0; // current tare weight
int CURRENTCOUNT = 0;
int CURRENTWEIGHT = 0;
int AVERAGEWEIGHT = 0;

int CURRENTCOINCOUNT = 0;

StructPMC* pmcbase = PMC_BASE;     // Basisadresse des PMC	
StructPIO* piobaseB = PIOB_BASE;	// Basisadresse PIOB 
StructAIC* aicbase = AIC_BASE;

void reverse(char* string, int length) {
	int start, end;
	char temp;
	
	for (start=0, end=length-1; start<end; start++, end--) {
	temp=*(string+start);
	*(string+start)=*(string+end);
	*(string+end)=temp;
	}
}


void IntAusgabe(int uebergebenes)
{
    int arraygroesse = 0;
    int isNegative = 0;
    char zahlstring[12];
    
    if(uebergebenes == 0x80000000) {
    	puts("-2147483648");
	return;
    }
    
    if(uebergebenes == 0) {
    	zahlstring[arraygroesse]='0';
	arraygroesse++;
	zahlstring[arraygroesse]='\0';
	puts(zahlstring);
	return;
    }
    
    if(uebergebenes < 0) {
    	isNegative = 1;
	uebergebenes = -uebergebenes;
    }
    
    while(uebergebenes > 0) {
    	int aktziffer = uebergebenes % 10;
	int aktasciicode = 48 + aktziffer;
	zahlstring[arraygroesse] = aktasciicode;
	arraygroesse++;
	
	uebergebenes = uebergebenes / 10;
    }
    
    if(isNegative == 1) {
    	zahlstring[arraygroesse++] = '-';
    }
    
    zahlstring[arraygroesse] = '\0';
    
    reverse(zahlstring, arraygroesse);
    puts(zahlstring);
    return;
}


void Timer_Init(void)
{
	tcbase4->TC_CCR		=	TC_CLKDIS;//disable clock counter
	tcbase4->TC_CMR		=	TC4_INIT;
	tcbase4->TC_CCR		=	TC_CLKEN; // enable clock counter
	
	tcbase5->TC_CCR		=	TC_CLKDIS;//disable clock counter
	tcbase5->TC_CMR		=	TC5_INIT;
	tcbase5->TC_CCR		=	TC_CLKEN; // enable clock counter
}

void PIO_Init(void)
{
	StructPMC* pmcbase  = PMC_BASE;
	StructPIO* piobaseA = PIOA_BASE;
	StructPIO* piobaseB = PIOB_BASE;
	pmcbase->PMC_PCER   = 0x06c00;
	piobaseA->PIO_PDR   = 0x090;			
}

void getAverageWeight(int currentWeight)
{
	if(CURRENTCOUNT == AVERAGECOUNT)
	{
		// 20 weights have been checked
		AVERAGEWEIGHT = CURRENTWEIGHT/CURRENTCOUNT;
		CURRENTWEIGHT = 0;
		CURRENTCOUNT = 0;
		return;
	}
	
	CURRENTWEIGHT = CURRENTWEIGHT + currentWeight;
	CURRENTCOUNT++;
}

void Waage_Init(){
    PIO_Init();	
    Timer_Init();   
}



void numberToBinary(int coinNumber) 
{ 
    int c, k;
    int ledCounter = 7;

    for (c = 7; c >= 0; c--)
    {
        k = coinNumber >> c;
	ledCounter++;

        if (k & 1)
	{
		piobaseB->PIO_CODR = 1 << ledCounter;
	}
        else
	{
		 piobaseB->PIO_SODR = 1 << ledCounter;
	}
    }
} 


void tare()
{
    TAREWEIGHT = MessungderMasse();
    puts("Masse vor dem tarieren: ");
    
    IntAusgabe(TAREWEIGHT);
    puts("\n");
    
    TARE = 1;
    puts("Es wurde tariert\n");
    
    puts("\n");
    puts("Bitte Taste 2 (SW2) betaetigen um die Messung zu beginnen. \n");
}


int main(void)
{
	inits();
	
  // Initialisieriung der Peripherie (KEYS, LEDS)
    piobaseB->PIO_IER = KEY1|KEY2|KEY3;
    piobaseB->PIO_PER = ALL_LEDS;
    piobaseB->PIO_OER = ALL_LEDS;
    
    // all leds off
    piobaseB->PIO_SODR = ALL_LEDS;
	
	puts("\n");
	puts("Hallo vom Muenzzaehler");
	puts("\n");
	puts("Bitte zuerst die Taste 1 (SW1) betaetigen zum tarieren");
	puts("\n");
	puts("Nach dem tarieren betaetige die Taste 2 (SW2) um die Messung zu starten");
	puts("\n");
	puts("Sobald die Messung beendet werden sollte, bitte die Taste 3 (SW3) betaetigen");
	puts("\n");

    while (1)
    {
        // Taste 1 - TARE
        if (!(piobaseB ->PIO_PDSR&KEY1))
        {
            if(!TARE && !WEIGHING)
            {
	     	piobaseB->PIO_SODR = ALL_LEDS;
                Waage_Init();
                tare();
		
		OUTPUT = 0;
            }
        }
        
        // TASTE 2 - INIT WAGE
        if (!(piobaseB ->PIO_PDSR&KEY2))
        {
            if (TARE && !WEIGHING)
            {
                WEIGHING = 1;
                puts("Es wird jetzt gewogen  \n");
            }
        }
	
	
	//TASTE 3 - Ausgabe (Brutto,Netto,Anzahl muenzen)
    	if (!(piobaseB -> PIO_PDSR & KEY3))
	{
	    if (!OUTPUT && TARE && WEIGHING)
	    {
	    	puts("Tare Gewicht: ");
		IntAusgabe(TAREWEIGHT);
		puts("\n");
		
		puts("Netto Gewicht: ");
		IntAusgabe(AVERAGEWEIGHT);
		puts("\n");
		
		puts("Brutto Gewicht (Tare + Netto): ");
		IntAusgabe(TAREWEIGHT + AVERAGEWEIGHT);
		puts("\n");
		
		puts("Anzahl Muenzen: ");
		IntAusgabe(CURRENTCOINCOUNT);
		puts("\n");
		puts("\n");
		puts("\n");
		puts("\n");
		
		puts("Wiegeprozess wurde beendet, bitte Taste 1 zum erneuten tarieren betaetigen");
		puts("\n");
		puts("\n");
		
    		TARE = 0;
		WEIGHING = 0;
		CURRENTCOUNT = 0;
		TAREWEIGHT = 0;
		AVERAGEWEIGHT = 0;
		
		OUTPUT = 1;
	    }
    	}
	
	
        // wiegen
        if(TARE && WEIGHING)
        {
            int Masse = MessungderMasse() - TAREWEIGHT;
	    getAverageWeight(Masse);
	    
	    if(AVERAGEWEIGHT != 0)
	    {
	    	int coinweight = COINWEIGHT / 2;
	    	int temp = (AVERAGEWEIGHT * 100)+coinweight;
		int anzahlmuenze = temp / COINWEIGHT;
		
		puts("Aktuelles gewicht: ");
		IntAusgabe(AVERAGEWEIGHT);
		puts ("\n");
		
		if(anzahlmuenze > 0)
		{
			CURRENTCOINCOUNT = anzahlmuenze;
			numberToBinary(anzahlmuenze);
		}
		else
		{
			numberToBinary(0);
		}
	    }
        }
    }
	return 0;
}


int MessungderMasse(void)
{
	volatile int captureRA1;
	volatile int captureRB1;
	volatile int captureRA2;
	volatile int captureRB2;
	volatile int capturediff1;
	volatile int capturediff2;
	volatile float Periodendauer1;
	volatile float Periodendauer2;
	volatile int result;

	tcbase4->TC_CCR	=	TC_SWTRG;	
	tcbase5->TC_CCR = 	TC_SWTRG;
	
	while (!(tcbase4->TC_SR & 0x40)); // Capture Register B wurde geladen Messung abgeschlossen
	while (!(tcbase5->TC_SR & 0x40)); // Capture register B2 wurde geladen Messung abgeschlossen

	captureRA1	= tcbase4->TC_RA;	
	captureRB1	= tcbase4->TC_RB;
	captureRA2	= tcbase5->TC_RA;	
	captureRB2	= tcbase5->TC_RB;
	capturediff1	= abs(captureRB1) - abs(captureRA1);
	capturediff2 	= abs(captureRB2) - abs(captureRA2);
	Periodendauer1 = abs(capturediff1);	
	Periodendauer2 = abs(capturediff2);// Zeit in us
	result = C1*((Periodendauer1/Periodendauer2)-1)-C2;
	
	return result ;

}









