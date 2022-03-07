# list .c source files here
SRCFILES=massmalloc.c

all:	massmalloc

massmalloc: $(SRCFILES) 
	gcc -Wall -o massmalloc $^ 

clean: 
	rm -f *.o massmalloc
