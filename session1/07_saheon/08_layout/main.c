#include <stdio.h>



void mem_inspection(unsigned char* p, int N){
    for(int i =0; i<N; i++)
        printf("mem[%d] is 0x%02X at 0x%p \n", i, *(p+i), p+i);       
}


//#define ALINGED 1
#ifdef ALINGED
struct foo{
    int   a; //4
    short b; //2
    char  c; //1
    int   d; //4 
    char  e; //1
    char  f; //1
    char  g; //1
    short h; //2
};
#else
struct foo{
    int   a; //4
    short b; //2
    short h; //2
    int   d; //4    
    char  c; //1
    char  e; //1
    char  f; //1
    char  g; //1
};
#endif

int main() {

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
    };
#endif

    printf("strcut");
}