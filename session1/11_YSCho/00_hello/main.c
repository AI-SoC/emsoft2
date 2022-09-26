// hello.c
#include <stdio.h>

extern int increment(int i);

int main() {
    int i=10;
    printf("Hello, world! youngsin %d\n", increment(i));
    return 0;
}

//ss