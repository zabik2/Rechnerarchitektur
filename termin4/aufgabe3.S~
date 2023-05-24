// Loesung Aufgabe 3 und 4 von Termin4 Rechnerarchitektur WS2011
// Name: 	Matrikelnummer:
// Name: 	Matrikelnummer:
// Datum:
	.file "aufgabe3.S"
	.text 		@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align 2 	@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen	
			@ unteren 2 Bit sind 0
	.global main 	@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type main,function
main:
	stmfd sp!, {r4, r5, lr} @ Ruecksprungadresse und Register sichern
kopieren:
@ hier Ihr Programm zum Kopieren einer Byte-Tabelle (je 8Bit) in eine Word-Tabelle (je 32Bit) einfuegen
 


vorzeichen:
@ hier Ihr Programm um die 8Bit-Zahlen auf vorzeichenrichtige 32Bit-Zahlen zu wandeln

		
	
sortieren:
@ hier Ihr Programm um die vorzeichenrichtige Zahlen in Liste2 zu sortieren


fertig:
	ldmfd sp!, {r4, r5, pc} @ Ruecksprungadresse und Register

TAB2: .word Liste2 @ Beispiel um an Adressen aus anderen Segmenten zu kommen

.Lfe1:
	.size main,.Lfe1-main

// .data-Section fuer initialisierte Daten
	.data
// Erster Wert der Tabelle steht fuer die Anzahl (max. 64) der Werte der Tabelle
Liste1: .byte (Liste1Ende-Liste1), -9, 8, -7, 6, -5, 4, -3, 2, -1, 0, 127, 128
Liste1Ende:

// .comm-Section fuer nicht initialisierte Daten
	.comm Liste2, ((Liste1Ende-Liste1)*4) 	@ Speicherbereich mit der Groesse*4 von Liste1 reservieren

// End of File

