// hello.c
#include <stdio.h>

extern int increment(int i);

int main() {
    int i = 13;
    printf("Hello, world! %d\n", increment(i));
    return 0;
}
