#include <stdio.h>
#define ALIGNED 2

#if ALIGNED==1

typedef struct foo
{
    /* data */
    int a;
    short b;
    char c;
    int d;
    char e;
    char f;
    char g;
    short h;

} foo;
#else
typedef struct foo
{
    /* data */
    int a;
    short b;
    short h;

    int d;
    char c;
    char e;
    char f;
    char g;

} foo;

#endif

void mem_inspection(unsigned char *p, int N)
{
    for (int i = 0; i < N; ++i)
    {
        printf("mem[%d] is 0x%02X at 0x%p\n", i, *(p + i), p + i);
    }
    printf("\n");
}

int main(void)
{
    printf("Running....\n");

#if ALIGNED==1
    foo f1 =
        {
            0x12345678,
            0xFBCD,
            0xAB,
            0x12345678,
            0xEE,
            0xCC,
            0xEE,
            0xDDFF,
        };
#else
    foo f1 =
        {
            0x12345678,
            0xFBCD,
            0xDDFF,
            0x12345678,
            0xEE,
            0xAB,
            0xCC,
            0xEE,
        };

#endif
    printf("struct foo's size is %d", sizeof(foo));

    return 0;
}