// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe4.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	ldr	r4, =Total
	ldr	r5, =Table
	ldr	r6, =Count

loop:
	ldr	r1, [r4]	//lade Total in r1

Add_instr:
	ldr	r2, [r5], #4	// postincrement, gehe Table durch
	add	r1, r1, r2	// Addiere Total und Tabelenwert
	str	r1, [r4]	// Total update mit neuem Wert

	ldr	r1, [r6]
	sub	r1, r1, #1
	str	r1, [r6]	// Counter dekrementierung

	cmp	r1, #0
	bgt 	loop



Halt:
	b	Halt

.Lfe1:
	.size	main,.Lfe1-main

	.data
//; Data definitions
//Total 	DEFW 0 ; Total - initially zero
Total:	.word	0
//One 	DEFW 1 ; The number one
//Count 	DEFW 4 ; Loop counter (loop 5x)
Count:	.word	5
//Table 	DEFW 39 ; The numbers to total ...
//	DEFW 25 ;
//	DEFW 4 ;
//	DEFW 98 ;
//	DEFW 17 ;
Table:	.word	39, 25, 4, 98, 17

	

// End of File

