# pre processing
main.i: main.c
	cpp main.c > main.i

# compile only (C code -> assembly)	
main.s: main.i
	gcc -S main.i

# asembling (assembly code -> object code)
main.o: main.S
	as -o main.o main.S

foo.o: foo.C
	gcc -c foo.c

foo2.o: foo2.C
	gcc -c foo2.c


# linking
all: main.o foo2.o
	gcc -o main main.o foo2.o
	./main
