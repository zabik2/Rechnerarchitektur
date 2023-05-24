# Makefile fuer Rechnerarchitekturpraktikum Termin 3 SS2021
# von: Manfred Pester
# vom: 30.09.2020
# letzte Aendenrung: 16.03.2021
#
# Variable fuer den zu nutzenden Compiler
GCC = arm-eb63-elf-gcc
# evtl.
# GCC = arm-elf-gcc

all: aufgabe1 aufgabe2 aufgabe3 aufgabe5 zusatzaufgabe1 zusatzaufgabe2

#aufgabe1: aufgabe1.S
#	$(GCC) -g aufgabe1.S -o aufgabe1.elf

aufgabe2: aufgabe2.S
	$(GCC) -g aufgabe2.S -o aufgabe2.elf
	
aufgabe3: aufgabe3.S
	$(GCC) -g aufgabe3.S -o aufgabe3.elf

aufgabe5: aufgabe5.S
	$(GCC) -g aufgabe5.S -o aufgabe5.elf

zusatzaufgabe1: zusatzaufgabe1.S 
	$(GCC) -g  zusatzaufgabe1.S -o zusatzaufgabe1.elf

zusatzaufgabe2: zusatzaufgabe2.S 
	$(GCC) -g  zusatzaufgabe2.S -o zusatzaufgabe2.elf

debug:
	arm-eb63-elf-insight
	
clean:
	rm *.elf
				
