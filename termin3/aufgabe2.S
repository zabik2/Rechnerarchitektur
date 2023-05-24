// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe2.S"
	.text		@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2	@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
			@ unteren 2 Bit sind 0
	.global	main	@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	MOV	R4, #27
	MOV	R5, #4

Loop:
	CMP	R4, #0
	BGT	Dec

	Add	R4, R4, R5
	
Dec:
	Sub	R4, R4, R5
	B	Loop

	MOV	R3, #0xB
	MOV 	R4, #0xFFFFFFF5
	MOV	R5, #0x7FFFFFFF
	MOV	R6, #0x2

	ADDS	r0, r1, r2	@ setzt nur das Vorzeichenflag
	ADDS	R0, R1, R4	@ setzt nur das Vorzeichenflag
	EORS	R0, R3, R3	@ setzt nur das Zeroflag
	MOVS	R0, R4, LSL #1	@ setzt nur das Carryflag
	ADDS	R0, R5, R6	@setzt nur das Overflowflag
@ weitere Loesungen	



	bx	lr
.Lfe1:
	.size	main,.Lfe1-main

// End of File
