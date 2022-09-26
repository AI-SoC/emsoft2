help:
	@echo "make help"
	@echo "make all"

# pre-processing only
pre: main.c
	cpp main.c > main.i

# compilation only
comp: main.i
	gcc -S main.i

# assembling only
asm: main.s
	as -o main.o main.s

main.o: main.c
	gcc -c main.c

foo.o: foo.c
	gcc -c foo.c

all: main.o foo.o
	gcc -o main main.o foo.o
	./main

clean: 
ifeq ($(OS),Windows_NT)
	del *.o
else
	rm -rf *.o
endif

cleanup: clean
ifeq ($(OS),Windows_NT)
	del *.exe	
else
	rm -rf main
endif

	

