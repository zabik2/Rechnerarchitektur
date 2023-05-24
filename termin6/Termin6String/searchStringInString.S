// Loesung Termin6 Rechnerarchitektur WS2020/21
// Name: 	Matrikelnummer:
// Name: 	Matrikelnummer:
// Datum:

@ in R0 wird die Adresse des zu durchsuchenden Text erwartet.
@ in R1 wird die Adresse des zu suchendenn Text erwartet.
@ sollte R0 auf einen leeren String zeigen,
@ oder der gesuchte Text nicht gefunden werden,
@ so wird in R0 der Wert 0 zurueck geliefert.
@ zeigt R1 auf einen leeren String so wird in R0 der Wert 0 zurueck gegeben
 
	.file	"searchStringInString.S"
	.text
	.align	2
	.global	searchStringInString
	.type	searchStringInString, %function

main:

	push {lr}

	bl searchStringInString

	pop {lr}

	
searchStringInString:
	
	push {r4 - r6, lr}

	ldr r0, =Text		@lade Adresse von Text in r0
	ldr r1, =SearchString
	ldr r2, =EmptyString

	mov r3, #0	@ counter for partial hits
	mov r6, #0	@ counter for full hits

	LOOP:
	ldrb 	r4, [r0], #1	@ get text searched char
	cmp	r4, #0		@ check if end of the text, or it's already empty
	BEQ	Leave		@ leave

	ldrb 	r5, [r1]	@ get string searched symbol
	cmp 	r5, #0		@ check if string to be searched is empty (subtask)
	bEQ	Leave		@ leave

	cmp 	r4, r5

	movNE 	r3, #0	@ if a miss, r3 counter is reset
	BNE 	LOOP	@ if current symbol not equal to searched string, we jump to loop, to go to the next symbol

	addEQ 	r3, r3, #1	@ increase partial hits counter
	addEQ	r5, r5, #1	@ get next char in case of a hit

	cmp 	r3, #2	@ check for 2 symbol hits
	addEQ 	r6, #1	@ in case of 2 partial hits, get a full hit
	movEQ 	r3, #0	@ and reset partial hits
	subEQ	r5, #1	@ go to first char of searched string
	
	B 	LOOPS

Leave:

	mov	r0, r6 	@ gives us total number of hits in Text moved to r0
	pop {r4- r6, pc}

.data
	Text:
		 .asciz "hallo Alles klar?"	@asciz damit mit 0 endet

	SearchString: 
		.ascii "ll"

	Emptystring:
		.asciz ""
	


.Lfe1:
	

	
	@.size	searchStringInString, .-searchStringInString

