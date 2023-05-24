// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe5.S"
	.text		@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2	@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
			@ unteren 2 Bit sind 0
	.global	main	@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	push	{r4, r5, r6, r7, lr}	@ Register retten
	mov	r4, #1
	mov	r5, #-1
	mov	r6, #15
	mov	r7, #0x80000000
//..


	pop	{r4, r5, r6, r7, pc}	@ Register restaurieren und Rücksprung
.Lfe1:
	.size	main,.Lfe1-main

// End of File
