// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe3.S"
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
	ldr	r1, [r4]	// Lade Total in r1, am Anfang also 0

Add_instr:
	ldr	r2, [r5]	// lade Table in r2
	add	r1, r1, r2	// addiere Total und Table
	str	r1, [r4]		// aktualisiere Total mit der Summe
	
	ldr	r1, Add_instr	// iwie Magie, mit Add_instr +4, geht die Tabelle auch +4
	add	r1, r1, #4
	str	r1, Add_instr

	ldr	r1,[r6]		// Lade Counter in r1
	sub	r1, r1, #1	// dekrementiere Counter
	str	r1, [r6]
	cmp	r1, #0
	bge	loop
	b	Halt



Halt:
	b	Halt

//; Data definitions
//Total 	DEFW 0 ; Total - initially zero
Total:	.word	0
//One 	DEFW 1 ; The number one
//Count 	DEFW 4 ; Loop counter (loop 5x)
Count:	.word	4
//Table 	DEFW 39 ; The numbers to total ...
//	DEFW 25 ;
//	DEFW 4 ;
//	DEFW 98 ;
//	DEFW 17 ;
Table:	.word	39, 25, 4, 98, 17


.Lfe1:
	.size	main,.Lfe1-main

// End of File
