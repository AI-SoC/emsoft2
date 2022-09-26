# pre processing
main.i: main.c
	cpp main.c > main.i

# compile only (c code -> assembly)
main.s: main.i
	gcc -S main.i

# asembling (assembly code -> object code)
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

