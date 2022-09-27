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
    printf("b is 0x%8X at 0x%p\n", *bp, &b);

    //little endian : 0x78 0x56 0x34 0x12
    //big endian : 0x12 0x34 0x56 0x78
    
    //read by 1byte
    unsigned char* mbp = (unsigned char*)bp;
    printf("@%p | %2X\n", (mbp+0), *(mbp+0));
    printf("@%p | %2X\n", (mbp+1), *(mbp+1));
    printf("@%p | %2X\n", (mbp+2), *(mbp+2));
    printf("@%p | %2X\n", (mbp+3), *(mbp+3));

    //change 0x56 -> 0x88
    *(mbp+1) = 0x88;
    printf("b is 0x%8X at 0x%p\n", *bp, &b);

    /*
    print result --> little endian
    @000000000061FE00 | 78
    @000000000061FE01 | 56
    @000000000061FE02 | 34
    @000000000061FE03 | 12
    */

    return 0;
}