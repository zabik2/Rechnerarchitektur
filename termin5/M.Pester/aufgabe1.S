// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe1.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	push	{r6, r9, lr}
	ldr	r9, =0x8000
	
	ldmda	r9, {r1, r2, r6}
	stmib	r9!, {r1, r2, r6}

	pop	{r6, r9, pc}
.Lfe1:
	.size	main,.Lfe1-main

// End of File
