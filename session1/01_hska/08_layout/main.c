#include <stdio.h>


/*
struct ADC_CONFIG {
    unsigned char CNFG1;
    unsigned char CNFG2;
    unsigned short MODE;


};
*/


void mem_inspection(unsigned char* p, int N){
    for(int i=0; i<N; i++)
        printf("mem[%d] is 0x%02X at 0x%p\n", i, *(p+i), p+i);
}

//#define ALINGED 1
#ifdef ALINGED
struct foo{
    int a;
    short b;
    char c;
    int d;
    char e;
    char f;
    char g;
    short h;

};
#else
struct foo{
    int a;
    short b;
    short h;
    int d;
    char c;
    char e;
    char f;
    char g;
};


#endif

int main()  {
    printf("Running...\n");

#ifdef ALINGED 
    struct foo f1 = {
        0x12345678,
        0xFBCD,
        0xEE,
        0x12345678,
        0xAB,
        0xCC,
        0xEE,
        0xDDFF
             };
#else
    struct foo f1 = {
        0x12345678,
        0xFBCD,
        0xDDFF,
        0x12345678,
        0xEE,
        0xAB,
        0xCC,
        0xEE
         };
    
#endif

    mem_inspection(&f1, sizeof(f1));

    printf("size is %d bytes",sizeof(f1));

    return 0;
}

