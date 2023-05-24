// Programmgeruest zur Aufgabe Termin6 WS2019
// von: Manfred Pester
// vom: 18.09.2013
// @ int Operationen(volatile unsigned int* u_int_Taster, volatile unsigned int* u_int_LedsOn) 
@ Diese Funktion soll auf 
@ - LED DS1 (Bit 8) das Ergebnis von SW1 AND SW2 anzeigen 
@ - LED DS2 (Bit 9) das Ergebnis von SW1 OR SW2 anzeigen 
@ - LED DS3 (Bit 10) das Ergebnis von SW1 EOR SW2 anzeigen 
@ - LED DS4 und 5 (Bit 11/12) das Ergebnis von SW1 ADD SW2 anzeigen 
@ - LED DS6 und 7 (Bit 13/14) das Ergebnis von SW1 SUB SW2 anzeigen 
@ und bei gedrueckter TASTE SW3 (Bit 5) soll die Funktion ein TRUE (Wert ungleich 0) ansonsten FALSE (Wert gleich 0) an das aufrufende Programm zurueck geben.
@ ACHTUNG die Tasten und auch die Leuchtdioden sind Low-Aktiv beschaltet.
	.file	"Funktionen.S" 
	.text 
	.align	2 
	.global	Operationen 
	.type	Operationen, %function 
Operationen: 


// PDSR == SW1 - SW3
// u_init_Taster = PDSR 

push {r5-r6, lr} // push für R0-R4 nicht notwendig, da scratch register



@A2	
	LDR	R2, [R0]	// Lade status aus Adresse R0, in R2

@A3	while Schleife für Bit ersetzung zu 0?
// 	STR	#0, [R1] (kann man so?) -> einfach alles auf 0 in der Adresse

	 
@A4 Vorbereitung -> Dioden ausschalten
	STR	#FF, [R1]
	
@A4
// AND	

	LDRb	R5, [R2, 3]	// Lade SW1 bit (Stelle 3) to R5
	LDRb	R6, [R2, 4]	// Lade SW2 bit (Stelle 4) to R6

	AND	R5, R6		// Ergebniss in R5
	MVN	R5, R5		// inverts result for low active

	STRb	R5, [R1, 0]	// Speichere R5 an Stelle von bit 8, aber in [R1] ist es bit 0

// OR	 

	LDRb	R5, [R2, 3]	// Lade SW1 bit (Stelle 3) to R5
	LDRb	R6, [R2, 4]	// Lade SW2 bit (Stelle 4) to R6

	ORR	R5, R6		// Ergebniss in R5 von or
	MVN	R5, R5		// inverts result for low active

	STRb	R5, [R1, 1]	// Speichere R5 an Stelle von bit 9, aber in [R1] ist es bit 1


// EOR 

	LDRb	R5, [R2, 3]	// Lade SW1 bit (Stelle 3) to R5
	LDRb	R6, [R2, 4]	// Lade SW2 bit (Stelle 4) to R6

	EOR	R5, R6		// Ergebniss in R5 von eor
	MVN	R5, R5		// inverts result for low active

	STRb	R5, [R1, 2]	// Speichere R5 an Stelle von bit 10, aber in [R1] ist es bit 2


// ADDITION	 

	LDRb	R5, [R2, 3]	// Lade SW1 bit (Stelle 3) to R5
	LDRb	R6, [R2, 4]	// Lade SW2 bit (Stelle 4) to R6

	ADD	R5, R6		// Ergebniss in R5 von ADD

	CMP	R5, #2		// Check if both switches enabled
	STRBeq	#0, [R1, 4]	// Dioden werden bei lowactive angeschaltet, deswegen "#0". DS5 repräsentiert beide switsches an

	CMP	R5, #1		// Check if one of the switches is enabled
	STRBeq 	#0, [R1, 3]	// DS4 wird eingeschaltet

	CMP	R5, #0		// Check if both switches off
	STRBeq	#1, [R1, 3]
	STRBeq	#1, [R1, 4]	// Redundantes Code, da Dioden eh ausgeschaltet gewesen sein sollten.



// SUBTRAKTION 

	LDRb	R5, [R2, 3]	// Lade SW1 bit (Stelle 3) to R5
	LDRb	R6, [R2, 4]	// Lade SW2 bit (Stelle 4) to R6

	SUB	R5, R6		// Ergebniss in R5 von ADD

	CMP	R5, #0		// Check if both switches enabled
	STRBeq	#0, [R1, 4]	// Dioden werden bei lowactive angeschaltet, deswegen "#0". DS7 repräsentiert beide switsches an

	CMN	R5, #1		// Check if one of the switches is enabled -> compare negative
	STRBeq 	#0, [R1, 3]	// DS6 wird eingeschaltet

	CMP	R5, #0		// Check if both switches off
	STRBeq	#1, [R1, 3]
	STRBeq	#1, [R1, 4]	// Redundantes Code, da Dioden eh ausgeschaltet gewesen sein sollten.

	 
// Beenden 

// SW3 to R0

	LDRb	R5, [R2, 5]	// Lade SW3 bit (Stelle 5) to R5
	MVN	R0, R5
	

pop {r5 - r6, pc}
 
.Lfe1: 
	.size	Operationen,.Lfe1- Operationen 
// End of File
