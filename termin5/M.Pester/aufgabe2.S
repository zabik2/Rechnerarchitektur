// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe2.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	push	{lr}

	mov 	r2, #8
	mov	r3, #2
	mov	r4, #42 // nicht scratch
	mov	r5, #62	// nicht scratch

	bl	up1
	bl	up2
	bl	up3
	
	pop		{pc}


@@ für Englische Version braucht man hier **nicht** Scratchregister + Blattroutine (ruft up2 auf)
up1:
	push	{r4, r5, lr} // gerne auch stmfd sp!, {r4, r5, lr}
	add	r4, r4, r5
	bl	up2
	pop	{r4, r5, pc}
	

@@ für englishV nur Scratchregister und eine Blattroutine
up2:
	sub	r2, r2, r3
	bx	lr


@@ für Englische Version werden **nicht** Scratchregister verwendet, keine Blattroutine (ruft up1 auf)
up3:
	push 	{r4, r5, lr}
	sub	r4, r5, r4
	bl	up1
	pop	{r4, r5, pc}


.Lfe1:
	.size	main,.Lfe1-main

// End of File
