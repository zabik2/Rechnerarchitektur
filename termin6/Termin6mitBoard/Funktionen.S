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
	 
// AND	 

// OR	 

// EOR 

// ADDITION	 

// SUBTRAKTION 

	 
// Beenden 

 
.Lfe1: 
	.size	Operationen,.Lfe1- Operationen 
// End of File
