# pre processing
main.i: main.c
	cpp main.c > main.i


# Comile only (c-code --> assembly)
#comp: main.i
main.s: main.i
	gcc -S main.i

# assembling (assembly code --> object code)
#asm: main.s	
main.o: main.s	#이게 더 좋은 형태 그 이유는 파일생성시 있는거 제외하고 없는거만 생성됨
	as -o main.o main.s

foo.o: foo.c
	gcc -c foo.c

foo2.o: foo2.c
	gcc -c foo2.c

# linking(final)
all: main.o foo2.o 
	gcc -o main main.o foo2.o 
	./main
	