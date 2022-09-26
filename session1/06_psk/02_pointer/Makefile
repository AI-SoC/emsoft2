
main.i : main.c
	cpp main.c > main.i

main.S : main.i
	gcc -S main.i

main.o : main.S
	as -o main.o main.S

all : main.o
	gcc -o main main.c
	./main

clean :
	del *.o *.i *.S