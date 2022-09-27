#include <stdio.h>


void mem_inspection(unsigned char* p, int N)
{
    for (int i = 0; i < N; i++)
    {
        printf("mem[%d] is ox%02X at 0x%p\n", i, *(p+i), p+i);
    }
}

#define ALIGNED
#ifdef ALIGNED
struct foo 
{
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
struct foo 
{
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



int main()
{
    printf("Running...\n");
    
    #ifdef ALIGNED 
        struct foo f1 = 
        {
            0X12345678,
            0XFBCD,
            0XEE,
            0X12345678,
            0xAB,
            0XCC,
            0XEE,
            0XDDFF
        };
        #else
        struct foo f1 = 
        {
            0X12345678,
            0XFBCD,
            0XDDFF,
            0X12345678,

            0XEE,
            0xAB,
            0XCC,
            0XEE
            
        };

    #endif


}



