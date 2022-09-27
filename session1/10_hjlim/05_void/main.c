#include <memory.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
bool compare_int(int a, int b) { return a == b; }

bool compare(int type, void *ap, void *bp) {
    if (type == 0) {
        return *((int *)ap) == *((int *)bp);
    } else if (type == 1) {
        return *((double *)ap) == *((double *)bp);
    }
}

int main(void) {
    printf("Running...\n");

    int a = 10;
    int b = 10;

    if (compare_int(a, b))
        printf("a b is equal\n");

    if (compare(0, &a, &b))
        printf("a b is equal\n");
    return 0;
}