#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

void mem_inspection(uint8_t *p, int N) {
    for (int i = 0; i < N; i++)
        printf("mem[%d] - 0x%02X at %p.\n", i, *(p + i), p + i);
}
#define ALIGNED 1
#ifdef ALIGNED
typedef struct _foo {
    uint32_t a;
    uint16_t b;
    uint16_t h;
    uint32_t d;
    uint8_t c;
    uint8_t e;
    uint8_t f;
    uint8_t g;
} foo;
#else
typedef struct _foo {
    uint32_t a;
    uint16_t b;
    uint8_t c;
    uint32_t d;
    uint8_t e;
    uint8_t f;
    uint8_t g;
    uint16_t h;
} foo;

#endif

int main(void) {
    printf("Running ... \n");
    foo f1 = {0x12345678, 0xFBCD, 0xEE, 0x12345678, 0xAB, 0xCC, 0xEE, 0xDDEF};

    return 0;
}