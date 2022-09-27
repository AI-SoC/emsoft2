#include <stdint.h>
#include <stdio.h>

int main(void) {
    printf("Running...\n");

    int a = 10;
    int b = 0x12345678;
    int c = 10;
    printf("a is %d at 0x%p\n", a, &a);
    printf("b is 0x%8x at 0x%p\n", b, &b);
    printf("c is %d at 0x%p\n", c, &c);

    int *ap = &a;
    *ap = 200;
    printf("a is %d at 0x%p\n", *ap, &a);

    int *bp = &b;

    uint8_t *mbp = (uint8_t *)bp;
    printf("@%p | %2X\n", mbp + 0, *(mbp + 0));
    printf("@%p | %2X\n", mbp + 1, *(mbp + 1));
    printf("@%p | %2X\n", mbp + 2, *(mbp + 2));
    printf("@%p | %2X\n", mbp + 3, *(mbp + 3));
    *(mbp + 1) = 0x88;
    printf("b is 0x%8x at 0x%p\n", *bp, &b);

    return 0;
}