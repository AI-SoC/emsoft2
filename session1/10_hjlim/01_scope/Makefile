# pre-processing
main.i: main.c
	cpp main.c > main.i

# compile only (c -> assem)
main.s: main.i
	gcc -S main.i

# assembling (assem -> object)
main.o: main.s
	as -o main.o main.s

foo.o: foo.c 
	gcc -c foo.c

foo2.o: foo2.c 
	gcc -c foo2.c

# linking 
all: main.o foo2.o
	gcc -o main main.o foo2.o
	./main

clean: 
ifeq ($(OS),Windows_NT)
	del *.o *.i *.s
else
	rm -rf *.o *.i *.s
endif

cleanup: clean
ifeq ($(OS),Windows_NT)
	del *.exe	
else
	rm -rf main
endif
