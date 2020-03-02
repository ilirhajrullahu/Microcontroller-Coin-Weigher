@----------------------------------------------------------------------------
@ File Name           : ser_io.S
@ Object              : Ein- Ausgabe-Funktionen der seriellen Schnittstelle
@			welche ueber den Supervisor-Mode gehen
@			
@
@ Namen :		Matr.-Nr.:
@			Matr.-Nr.:
@
@----------------------------------------------------------------------------

@ Debuginformationen
	.file	"ser_io.S"

@ Funktion
	.text
	.align	2
	.global	inits
	.type	inits,function
inits:
	swi	0x100
	bx	lr	@ Rücksprung

@ Funktion
	.text
	.align	2
	.global	putc
	.type	putc,function
putc:
	mov	r1, r0		@ Zeichen nach r1
	ldr	r0, =Zeichen	@ Zeiger holen
	str	r1, [r0]	@ Zeichen unter Zeiger ablegen
	swi 	0x200		@ 
	ldr	r1, =Zeichen	@ Zeiger holen
	ldr	r0, [r1]	@ Zeichen aus Zeiger holen
	bx 	lr

@ Funktion
	.text
	.align	2
	.global	getc
	.type	getc,function
getc:
	ldr 	r0, =Zeichen	@ Zeiger holen
	swi 	0x300		
	ldr	r0, =Zeichen	@ Zeiger holen		
	ldr 	r0, [r0]	@ empfangenes Zeichen zurueck geben
	bx 	lr
	
@ Funktion
	.text
	.align	2
	.global	puts
	.type	puts,function
puts:
	stmfd sp!,{r4,r6,lr}	@ Retten der Register
	mov r6,r0		@r6 = Adresse des erten array buchstaben
	
// Hier muß Ihr Code eingefügt werden.

schleifenbeginn:
	ldrb r4,[r6],#1
	
	cmp r4,#0
	beq ende
	
testabfrage:
	mov r0,r4
	bl putc
	cmp r0,#0		@falls putc null -> putc nicht erfolgreich,retry testabfrage
	beq testabfrage		@versucht nochmal
	
	cmp r0,#0xA		@falls char == \n, die ausgegen wurde, dann muss auch carriege return ausgegeben werden
	moveq r4,#0xD
	beq testabfrage		@mov direct carriage return und wieder testabfrage
	
	b schleifenbeginn	@wieder in loop, nächstes char holen aus array
	
ende:
	ldmfd sp!,{r4,r6,pc}	@ Rücksprung
	
@ Funktion
	.text
	.align	2
	.global	gets
	.type	gets,function
gets:
	stmfd	sp!,{lr}	@ Retten der Register
	mov r5, r0		@mov adresse von übergeben array in r5
	
getsschleife:
	bl getc			@hole erste zeichen
	cmp r0,#0		@falls null in r0, also getc ist null, dann muss wieder getc aufgerufen werden
	beq getsschleife
	
	cmp r0,#0xD		@falls geholte zeichen ein carriege war, dann direkt zum ende gehen von gets
	beq ende2
	
	strb r0,[r5],#1
	b getsschleife
	
ende2:
	mov r0,#0		@mov 0 in r0
	strb r0,[r5],#1		@'0' zeichen markiert ende von array

	ldmfd 	sp!,{r5,pc}	@ Rücksprung
	
	.data
Zeichen:	.word 0			
.end
