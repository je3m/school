CC = gcc

CFLAGS = -Wall -c -g

## A list of options to pass to the linker. 
LDFLAGS = -Wall -g -lm

## Name the executable program, list source files
PROG = inventory
SRCS = inv.c inv.h 

## Build the program from the object files (-o option)
$(PROG): inv.o 
	$(CC) inv.o -o $(PROG) $(LDFLAGS)

inv.o: inv.c inv.h
	$(CC) $(CFLAGS) inv.c

## Remove all the compilation and debugging files
clean: 
	rm -f core $(PROG) *.o *~
