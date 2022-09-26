#include <stdio.h>

int main() {
    printf("Running...\n");

    int a = 10;
    int b = 0x12345678;
    printf("a is %d at 0x%p\n", a, &a);
    printf("b is 0x%8X at 0x%p\n", b, &b);

    int* ap = &a;
    *ap = 200;
    printf("a is %d at 0x%p\n", *ap, &a);

    int* bp = &b;
    printf("a is 0x%8X at 0x%p\n", *bp, &b);

    unsigned char* mbp = (unsigned char*)bp;
    printf("@%p | %2X\n", (mbp+0), *(mbp+0));
    printf("@%p | %2X\n", (mbp+1), *(mbp+1));   
    printf("@%p | %2X\n", (mbp+2), *(mbp+2));
    printf("@%p | %2X\n", (mbp+3), *(mbp+3));
    *(mbp+1) = 0x88;
    printf("a is 0x%8X at 0x%p\n", *bp, &b);

    return 0;
}