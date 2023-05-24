// Loesung zu Aufgaben 3 und folgende
// Name: 	 	Matrikelnummer: 
// Name: 		Matrikelnummer: 
// Datum:
	.file "aufgabe3.S"
	.text 		@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align 2 	@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen	
			@ unteren 2 Bit sind 0
	.global main 	@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type main,function
main:
	push {lr} @ Ruecksprungadresse und Register sichern
	LDR R0, Adr_StringA
	LDR R1, Adr_StringB

@	..
	bl kopieren
@	..
	bl reduzieren
@	..
	bl sortieren
	pop {pc}
	
kopieren:
@ hier Ihr Programm zum Kopieren eines String
loop_kopieren:	
@	..
	LDRB R3, [R0], #1
	STRB R3, [R1], #1
	CMP  R3, #0
	BNE  loop_kopieren
	bx lr


reduzieren:
@ hier Ihr Programm um alle Buchstaben (a..z; A..Z) zu entfernen
@	..
	bx lr	
	
	
sortieren:
@ hier Ihr Programm zum sortieren 
@	..
	LDR R1, Adr_StringB	@ Lade Adresse vom String in R1
	loop_sort:
	MOV 	R3, R1		@ Die Adresse ist nun in R3
	ADD 	R2, R1, #1	@ Nächstes Byte nach R1, in R2
	LDRB	R4, [R1], #1	@ In R4 wird die Datei aus R1 geladen, und R1 ist inkrementiert
	CMP	R4, #0		@ NZCV falls R4 am Ende des strings
	BXEQ	LR		@ Falls Ende des Strings, gehe zu LR
	MOV 	R5, R4		@ In R5 wird R4 gespeichert
	
	loop_kleinsteZahl:
	LDRB	R7, [R2]	@ Byte aus R2 (R1+1) in R7
	CMP	R7, #0		@ Falls R7 Ende des strings, go to swap
	BEQ	Tausch
	CMP	R7, R4		@ Vergleiche R7 und R4
	MOVMI	R4, R7		@ Falls R7-R3=negative Zahl, dann R4 = R7
	MOVMI	R6, R2		@ "" 				  R6 = R2
				@ Hier suchen wir nach der kleinsten Zahl im Durchlauf vom ganzen String
				@ String wird aber X mal durchlaufen, wo X, seine (fiktive) größe ist
	
	ADD	R2, R2, #1	@ R2 = R2+1
	B loop_kleinsteZahl	@ go to loop_kleinsteZahl
	
	Tausch:
	STRB 	R4, [R3]	@ Speichere aus R4 in R3 (kleinste Zahl in die fordere Stelle)
	STRB	R5, [R6]	@ Speichere aus R5 in R6 (aktulle Zahl in die Stelle, wo kleinste Zahl war)
	B loop_sort		@ go to loop_sort
	
	bx	lr		@ never actually reached

Adr_StringA:	.word StringA 	@ auf dieser Speicherstelle liegt die Adresse,
				@ welche auf das erste Zeichen von StringA zeigt
Adr_StringB: 	.word StringB	@ 

.Lfe1:
	.size main,.Lfe1-main

// .data-Section fuer initialisierte Daten
	.data
StringA: .asciz "Dies ist ein String"

// .comm-Section fuer nicht initialisierte Daten
	.comm StringB, 256 	@ Speicherbereich mit der max. Groesse eines StringA reservieren

// End of File

