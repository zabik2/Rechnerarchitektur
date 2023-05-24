// Gegebenes C-Programm zur Loeung von Termin6 Aufgabe 1
// von: Manfred Pester
// vom:  18.02.2013
// letzte Aenderung am 05.11.2020

#include "../h/pmc.h"
#include "../h/pio.h"

// Die Funktion Operationen erwartet die Registeradresse fuer das Pin Data Status Register PDSR aus dem die
// Tasteninformationen SW1 bis SW3 (Bit 3 bis Bit 5) gelesen werden koennen
// und die Registeradresse fuer das Clear Output Data Register CODR um die Leuchtdioden DS1 bis DS8 einschalten zu koennen 
// und liefert TRUE fuer Taste SW3 gedrueckt oder FALSE fuer Taste SW3 nicht gedrueckt zurueck.

int Operationen(volatile unsigned int* u_int_Taster, volatile unsigned int* u_int_LedsOn);

int main(void)
{
	int int_Weiter = 1;

// PowerManagementController Clock fuer PIOB einschalten		
	PMC_BASE->PMC_PCER = 0x4000;	

// Parallel I/O Controller PIOB Taster und Leuchtdioden aktivieren	
	PIOB_BASE->PIO_PER = 0xff38;	// alle Leuchtdioden DS1..DS8 und Taster SW1..SW3 aktiv
	PIOB_BASE->PIO_OER = 0xff00;	// fuer alle Leuchtdioden DS1..DS8 Ausgaenge aktivieren

// ueber das Register PIOB_BASE->PIO_PDSR koennen die Tasten-Bits gelesen werden
// ueber das Register PIOB_BASE->PIO_CODR koennen LED-Bits geloescht werden (cleared via Maske)
// ueber das Register PIOB_BASE->PIO_SODR koennen LED-Bits gesetzt werden (set via Maske)
// siehe auch S. 66 der im Labor ausliegenden Dokumentation für den ATMEL AT91
	while(1)
	{
		int_Weiter = Operationen(&PIOB_BASE->PIO_PDSR, &PIOB_BASE->PIO_CODR);
		if (int_Weiter!=0)
		{
			PIOB_BASE->PIO_SODR = 0xff00;	// alle 8 LED aus (lowaktiv)
		}
	}
	return 0;
}

