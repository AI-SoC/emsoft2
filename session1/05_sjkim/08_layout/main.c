#include <stdio.h>

void mem_inspection(unsigned char* p, int N){
    for(int i=0;i<N;i++)
        printf("mem[%d] is 0x%02X at 0x%p\n", i, *(p+i), p+i);
}

//#define ALIGNED 1
#ifdef ALIGNED
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
    short h; // 전부 4bytes씩으로 정리해서 align 체크

    int d;

    char c;
    char e;
    char f;
    char g;
};
#endif
int main(){
    printf("Running...\n");

    #ifdef ALIGNED
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
    printf("struct foo's size is %d\n", sizeof(f1));
    return 0;
}