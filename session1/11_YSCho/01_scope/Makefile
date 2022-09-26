# pre processing
main.i: main.c
	cpp main.c > main.i

# compile only (c code -> assembly)
main.s: main.i
	gcc -S main.i

# asembling (assembly -> object code)
main.o: main.s
	as -o main.o main.s

# 전처리, 컴파일, 어셈블 다 하는과정
foo.o: foo.c
	gcc -c foo.c

foo2.o: foo2.c
	gcc -c foo2.c

# linking
all: main.o foo2.o
	gcc -o main main.o foo2.o
	./main
