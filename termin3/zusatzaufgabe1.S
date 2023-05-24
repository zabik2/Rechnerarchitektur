// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"zusatzaufgabe1.S"
	.text		@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2	@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
			@ unteren 2 Bit sind 0
	.global	main	@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	ldr r0, = 0x87654321
//..


	bx lr
.Lfe1:
	.size	main,.Lfe1-main

// End of File
