	.file	"Termin6.c"
	.global	tcbase4
	.data
	.align	2
	.type	tcbase4, %object
	.size	tcbase4, 4
tcbase4:
	.word	-180160
	.global	tcbase5
	.align	2
	.type	tcbase5, %object
	.size	tcbase5, 4
tcbase5:
	.word	-180096
	.global	COINWEIGHT
	.align	2
	.type	COINWEIGHT, %object
	.size	COINWEIGHT, 4
COINWEIGHT:
	.word	574
	.global	AVERAGECOUNT
	.align	2
	.type	AVERAGECOUNT, %object
	.size	AVERAGECOUNT, 4
AVERAGECOUNT:
	.word	100
	.global	TARE
	.bss
	.align	2
	.type	TARE, %object
	.size	TARE, 4
TARE:
	.space	4
	.global	WEIGHING
	.align	2
	.type	WEIGHING, %object
	.size	WEIGHING, 4
WEIGHING:
	.space	4
	.global	OUTPUT
	.align	2
	.type	OUTPUT, %object
	.size	OUTPUT, 4
OUTPUT:
	.space	4
	.global	TAREWEIGHT
	.align	2
	.type	TAREWEIGHT, %object
	.size	TAREWEIGHT, 4
TAREWEIGHT:
	.space	4
	.global	CURRENTCOUNT
	.align	2
	.type	CURRENTCOUNT, %object
	.size	CURRENTCOUNT, 4
CURRENTCOUNT:
	.space	4
	.global	CURRENTWEIGHT
	.align	2
	.type	CURRENTWEIGHT, %object
	.size	CURRENTWEIGHT, 4
CURRENTWEIGHT:
	.space	4
	.global	AVERAGEWEIGHT
	.align	2
	.type	AVERAGEWEIGHT, %object
	.size	AVERAGEWEIGHT, 4
AVERAGEWEIGHT:
	.space	4
	.global	CURRENTCOINCOUNT
	.align	2
	.type	CURRENTCOINCOUNT, %object
	.size	CURRENTCOINCOUNT, 4
CURRENTCOINCOUNT:
	.space	4
	.global	pmcbase
	.data
	.align	2
	.type	pmcbase, %object
	.size	pmcbase, 4
pmcbase:
	.word	-49152
	.global	piobaseB
	.align	2
	.type	piobaseB, %object
	.size	piobaseB, 4
piobaseB:
	.word	-65536
	.global	aicbase
	.align	2
	.type	aicbase, %object
	.size	aicbase, 4
aicbase:
	.word	-4096
	.text
	.align	2
	.global	reverse
	.type	reverse, %function
reverse:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-1]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-16]
	add	r2, r1, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-1]
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	blt	.L3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	reverse, .-reverse
	.section	.rodata
	.align	2
.LC0:
	.ascii	"-2147483648\000"
	.text
	.align	2
	.global	IntAusgabe
	.type	IntAusgabe, %function
IntAusgabe:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r3, #-2147483648
	bne	.L6
	ldr	r0, .L14
	bl	puts
	b	.L13
.L6:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L8
	ldr	r2, [fp, #-20]
	mvn	r3, #27
	sub	r0, fp, #4
	add	r2, r0, r2
	add	r3, r2, r3
	mov	r2, #48
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mvn	r3, #27
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	r3, fp, #32
	mov	r0, r3
	bl	puts
	b	.L13
.L8:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bge	.L10
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	rsb	r3, r3, #0
	str	r3, [fp, #-36]
	b	.L10
.L11:
	ldr	r2, [fp, #-36]
	ldr	r1, .L14+4
	smull	r0, r3, r1, r2
	mov	r1, r3, asr #2
	mov	r3, r2, asr #31
	rsb	r1, r3, r1
	mov	r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #1
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #48
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-8]
	and	r2, r3, #255
	mvn	r3, #27
	sub	r0, fp, #4
	add	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ldr	r1, .L14+4
	smull	r0, r2, r1, r3
	mov	r2, r2, asr #2
	mov	r3, r3, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
.L10:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bgt	.L11
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L12
	ldr	r2, [fp, #-20]
	mvn	r3, #27
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #45
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L12:
	ldr	r2, [fp, #-20]
	mvn	r3, #27
	sub	r0, fp, #4
	add	r2, r0, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	r3, fp, #32
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	reverse
	sub	r3, fp, #32
	mov	r0, r3
	bl	puts
	mov	r0, r0	@ nop
.L13:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L15:
	.align	2
.L14:
	.word	.LC0
	.word	1717986919
	.size	IntAusgabe, .-IntAusgabe
	.align	2
	.global	Timer_Init
	.type	Timer_Init, %function
Timer_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L18
	ldr	r3, [r3, #0]
	mov	r2, #2
	str	r2, [r3, #0]
	ldr	r3, .L18
	ldr	r2, [r3, #0]
	mov	r3, #327680
	add	r3, r3, #64
	str	r3, [r2, #4]
	ldr	r3, .L18
	ldr	r3, [r3, #0]
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L18+4
	ldr	r3, [r3, #0]
	mov	r2, #2
	str	r2, [r3, #0]
	ldr	r3, .L18+4
	ldr	r2, [r3, #0]
	mov	r3, #327680
	add	r3, r3, #64
	str	r3, [r2, #4]
	ldr	r3, .L18+4
	ldr	r3, [r3, #0]
	mov	r2, #1
	str	r2, [r3, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L19:
	.align	2
.L18:
	.word	tcbase4
	.word	tcbase5
	.size	Timer_Init, .-Timer_Init
	.align	2
	.global	PIO_Init
	.type	PIO_Init, %function
PIO_Init:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #-1610612736
	mov	r3, r3, asr #15
	str	r3, [fp, #-12]
	mov	r3, #-1342177280
	mov	r3, r3, asr #14
	str	r3, [fp, #-8]
	mov	r3, #-2147483648
	mov	r3, r3, asr #15
	str	r3, [fp, #-4]
	ldr	r3, [fp, #-12]
	mov	r2, #27648
	str	r2, [r3, #16]
	ldr	r3, [fp, #-8]
	mov	r2, #144
	str	r2, [r3, #4]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	PIO_Init, .-PIO_Init
	.global	__divsi3
	.align	2
	.global	getAverageWeight
	.type	getAverageWeight, %function
getAverageWeight:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #4
	str	r0, [fp, #-8]
	ldr	r3, .L26
	ldr	r2, [r3, #0]
	ldr	r3, .L26+4
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	.L23
	ldr	r3, .L26+8
	ldr	r2, [r3, #0]
	ldr	r3, .L26
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__divsi3
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L26+12
	str	r2, [r3, #0]
	ldr	r3, .L26+8
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L26
	mov	r2, #0
	str	r2, [r3, #0]
	b	.L25
.L23:
	ldr	r3, .L26+8
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, .L26+8
	str	r2, [r3, #0]
	ldr	r3, .L26
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L26
	str	r2, [r3, #0]
.L25:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L27:
	.align	2
.L26:
	.word	CURRENTCOUNT
	.word	AVERAGECOUNT
	.word	CURRENTWEIGHT
	.word	AVERAGEWEIGHT
	.size	getAverageWeight, .-getAverageWeight
	.align	2
	.global	Waage_Init
	.type	Waage_Init, %function
Waage_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	bl	PIO_Init
	bl	Timer_Init
	ldmfd	sp!, {fp, pc}
	.size	Waage_Init, .-Waage_Init
	.align	2
	.global	numberToBinary
	.type	numberToBinary, %function
numberToBinary:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #7
	str	r3, [fp, #-4]
	mov	r3, #7
	str	r3, [fp, #-12]
	b	.L31
.L34:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	mov	r3, r2, asr r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-4]
	add	r3, r3, #1
	str	r3, [fp, #-4]
	ldr	r3, [fp, #-8]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L32
	ldr	r3, .L36
	ldr	r3, [r3, #0]
	mov	r1, #1
	ldr	r2, [fp, #-4]
	mov	r2, r1, asl r2
	str	r2, [r3, #52]
	b	.L33
.L32:
	ldr	r3, .L36
	ldr	r3, [r3, #0]
	mov	r1, #1
	ldr	r2, [fp, #-4]
	mov	r2, r1, asl r2
	str	r2, [r3, #48]
.L33:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L31:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L34
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L37:
	.align	2
.L36:
	.word	piobaseB
	.size	numberToBinary, .-numberToBinary
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Masse vor dem tarieren: \000"
	.align	2
.LC2:
	.ascii	"\012\000"
	.align	2
.LC3:
	.ascii	"Es wurde tariert\012\000"
	.align	2
.LC4:
	.ascii	"Bitte Taste 2 (SW2) betaetigen um die Messung zu be"
	.ascii	"ginnen. \012\000"
	.text
	.align	2
	.global	tare
	.type	tare, %function
tare:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	bl	MessungderMasse
	mov	r2, r0
	ldr	r3, .L40
	str	r2, [r3, #0]
	ldr	r0, .L40+4
	bl	puts
	ldr	r3, .L40
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	IntAusgabe
	ldr	r0, .L40+8
	bl	puts
	ldr	r3, .L40+12
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r0, .L40+16
	bl	puts
	ldr	r0, .L40+8
	bl	puts
	ldr	r0, .L40+20
	bl	puts
	ldmfd	sp!, {fp, pc}
.L41:
	.align	2
.L40:
	.word	TAREWEIGHT
	.word	.LC1
	.word	.LC2
	.word	TARE
	.word	.LC3
	.word	.LC4
	.size	tare, .-tare
	.section	.rodata
	.align	2
.LC5:
	.ascii	"Hallo vom Muenzzaehler\000"
	.align	2
.LC6:
	.ascii	"Bitte zuerst die Taste 1 (SW1) betaetigen zum tarie"
	.ascii	"ren\000"
	.align	2
.LC7:
	.ascii	"Nach dem tarieren betaetige die Taste 2 (SW2) um di"
	.ascii	"e Messung zu starten\000"
	.align	2
.LC8:
	.ascii	"Sobald die Messung beendet werden sollte, bitte die"
	.ascii	" Taste 3 (SW3) betaetigen\000"
	.align	2
.LC9:
	.ascii	"Es wird jetzt gewogen  \012\000"
	.align	2
.LC10:
	.ascii	"Tare Gewicht: \000"
	.align	2
.LC11:
	.ascii	"Netto Gewicht: \000"
	.align	2
.LC12:
	.ascii	"Brutto Gewicht (Tare + Netto): \000"
	.align	2
.LC13:
	.ascii	"Anzahl Muenzen: \000"
	.align	2
.LC14:
	.ascii	"Wiegeprozess wurde beendet, bitte Taste 1 zum erneu"
	.ascii	"ten tarieren betaetigen\000"
	.align	2
.LC15:
	.ascii	"Aktuelles gewicht: \000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	bl	inits
	ldr	r3, .L53
	ldr	r3, [r3, #0]
	mov	r2, #56
	str	r2, [r3, #64]
	ldr	r3, .L53
	ldr	r3, [r3, #0]
	mov	r2, #65280
	str	r2, [r3, #0]
	ldr	r3, .L53
	ldr	r3, [r3, #0]
	mov	r2, #65280
	str	r2, [r3, #16]
	ldr	r3, .L53
	ldr	r3, [r3, #0]
	mov	r2, #65280
	str	r2, [r3, #48]
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+8
	bl	puts
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+12
	bl	puts
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+16
	bl	puts
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+20
	bl	puts
	ldr	r0, .L53+4
	bl	puts
	b	.L48
.L50:
	mov	r0, r0	@ nop
	b	.L48
.L51:
	mov	r0, r0	@ nop
	b	.L48
.L52:
	mov	r0, r0	@ nop
.L48:
	ldr	r3, .L53
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #60]
	and	r3, r3, #8
	cmp	r3, #0
	bne	.L43
	ldr	r3, .L53+24
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L43
	ldr	r3, .L53+28
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L43
	ldr	r3, .L53
	ldr	r3, [r3, #0]
	mov	r2, #65280
	str	r2, [r3, #48]
	bl	Waage_Init
	bl	tare
	ldr	r3, .L53+32
	mov	r2, #0
	str	r2, [r3, #0]
.L43:
	ldr	r3, .L53
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #60]
	and	r3, r3, #16
	cmp	r3, #0
	bne	.L44
	ldr	r3, .L53+24
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L44
	ldr	r3, .L53+28
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L44
	ldr	r3, .L53+28
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r0, .L53+36
	bl	puts
.L44:
	ldr	r3, .L53
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #60]
	and	r3, r3, #32
	cmp	r3, #0
	bne	.L45
	ldr	r3, .L53+32
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L45
	ldr	r3, .L53+24
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L45
	ldr	r3, .L53+28
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L45
	ldr	r0, .L53+40
	bl	puts
	ldr	r3, .L53+44
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	IntAusgabe
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+48
	bl	puts
	ldr	r3, .L53+52
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	IntAusgabe
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+56
	bl	puts
	ldr	r3, .L53+44
	ldr	r2, [r3, #0]
	ldr	r3, .L53+52
	ldr	r3, [r3, #0]
	add	r3, r2, r3
	mov	r0, r3
	bl	IntAusgabe
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+60
	bl	puts
	ldr	r3, .L53+64
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	IntAusgabe
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+68
	bl	puts
	ldr	r0, .L53+4
	bl	puts
	ldr	r0, .L53+4
	bl	puts
	ldr	r3, .L53+24
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L53+28
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L53+72
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L53+44
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L53+52
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L53+32
	mov	r2, #1
	str	r2, [r3, #0]
.L45:
	ldr	r3, .L53+24
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L50
	ldr	r3, .L53+28
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L51
	bl	MessungderMasse
	mov	r2, r0
	ldr	r3, .L53+44
	ldr	r3, [r3, #0]
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	getAverageWeight
	ldr	r3, .L53+52
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L52
	ldr	r3, .L53+76
	ldr	r3, [r3, #0]
	mov	r2, r3, lsr #31
	add	r3, r2, r3
	mov	r3, r3, asr #1
	str	r3, [fp, #-16]
	ldr	r3, .L53+52
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, .L53+76
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-12]
	mov	r1, r3
	bl	__divsi3
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r0, .L53+80
	bl	puts
	ldr	r3, .L53+52
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	IntAusgabe
	ldr	r0, .L53+4
	bl	puts
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	ble	.L47
	ldr	r3, .L53+64
	ldr	r2, [fp, #-8]
	str	r2, [r3, #0]
	ldr	r0, [fp, #-8]
	bl	numberToBinary
	b	.L48
.L47:
	mov	r0, #0
	bl	numberToBinary
	b	.L48
.L54:
	.align	2
.L53:
	.word	piobaseB
	.word	.LC2
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	TARE
	.word	WEIGHING
	.word	OUTPUT
	.word	.LC9
	.word	.LC10
	.word	TAREWEIGHT
	.word	.LC11
	.word	AVERAGEWEIGHT
	.word	.LC12
	.word	.LC13
	.word	CURRENTCOINCOUNT
	.word	.LC14
	.word	CURRENTCOUNT
	.word	COINWEIGHT
	.word	.LC15
	.size	main, .-main
	.global	__floatsisf
	.global	__divsf3
	.global	__subsf3
	.global	__mulsf3
	.global	__fixsfsi
	.align	2
	.global	MessungderMasse
	.type	MessungderMasse, %function
MessungderMasse:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #36
	ldr	r3, .L59
	ldr	r3, [r3, #0]
	mov	r2, #4
	str	r2, [r3, #0]
	ldr	r3, .L59+4
	ldr	r3, [r3, #0]
	mov	r2, #4
	str	r2, [r3, #0]
.L56:
	ldr	r3, .L59
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #32]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L56
.L57:
	ldr	r3, .L59+4
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #32]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L57
	ldr	r3, .L59
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-8]
	ldr	r3, .L59
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-12]
	ldr	r3, .L59+4
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-16]
	ldr	r3, .L59+4
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	eor	r2, r3, r3, asr #31
	sub	r2, r2, r3, asr #31
	ldr	r1, [fp, #-8]
	eor	r3, r1, r1, asr #31
	sub	r3, r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	eor	r2, r3, r3, asr #31
	sub	r2, r2, r3, asr #31
	ldr	r1, [fp, #-16]
	eor	r3, r1, r1, asr #31
	sub	r3, r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	eor	r3, r2, r2, asr #31
	sub	r3, r3, r2, asr #31
	mov	r0, r3
	bl	__floatsisf
	mov	r3, r0
	str	r3, [fp, #-32]	@ float
	ldr	r2, [fp, #-28]
	eor	r3, r2, r2, asr #31
	sub	r3, r3, r2, asr #31
	mov	r0, r3
	bl	__floatsisf
	mov	r3, r0
	str	r3, [fp, #-36]	@ float
	ldr	r2, [fp, #-32]	@ float
	ldr	r3, [fp, #-36]	@ float
	mov	r0, r2
	mov	r1, r3
	bl	__divsf3
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L59+8	@ float
	bl	__subsf3
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L59+12	@ float
	bl	__mulsf3
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L59+16	@ float
	bl	__subsf3
	mov	r3, r0
	mov	r0, r3
	bl	__fixsfsi
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L60:
	.align	2
.L59:
	.word	tcbase4
	.word	tcbase5
	.word	1065353216
	.word	1183636480
	.word	1109393408
	.size	MessungderMasse, .-MessungderMasse
	.ident	"GCC: (crosstool-NG 1.13.3 - arm-elf) 4.4.6"
