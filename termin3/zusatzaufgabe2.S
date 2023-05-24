// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"zusatzaufgabe2.S"
	.text		@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2	@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
			@ unteren 2 Bit sind 0
	.global	main	@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	ldr	r1, =0x1234ABCD
	ldr	r2, =0xDCBA4321
@ hier Ihre Loesung ergaenzen



	bx	lr	@ Ruecksprung zum aufrufenden Programm
.Lfe1:
	.size	main,.Lfe1-main	@ Programmgroesse berechnen

// End of File
