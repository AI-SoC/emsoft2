#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

void mem_inspection(uint8_t *p, int N) {
    for (int i = 0; i < N; i++)
        printf("mem[%d] - 0x%02X at %p.\n", i, *(p + i), p + i);
}

void printOut(uint8_t arg) { printf("# 0x%02X\n", arg); }

#define ADC_EN_IDX 4
#define ADC_EOC 7

bool checkBit(uint8_t arg, uint8_t flag) { return (arg & (1 << flag)) != 0; }

typedef struct _bits8 {
    uint8_t b0 : 1;
    uint8_t b1 : 1;
    uint8_t b2 : 1;
    uint8_t b3 : 1;
    uint8_t b4 : 1;
    uint8_t b5 : 1;
    uint8_t b6 : 1;
    uint8_t b7 : 1;
} bits8;

typedef struct _adc_reg {
    uint8_t MODE : 4;
    uint8_t EN : 1;
    uint8_t NA : 2;
    uint8_t EOC : 1;
} adc_reg;

typedef union _PORT0 {
    uint8_t U;
    bits8 B;
    adc_reg R;
} PORT0;

int main(void) {
    printf("Running ... \n");

    uint8_t P0 = 0x95;

    P0 &= ~(1 << ADC_EN_IDX);
    printOut(P0);

    if (P0 & (1 << ADC_EN_IDX)) {
        printf("Enabled\n");
    } else {
        printf("Disabled\n");
    }

    P0 |= (1 << ADC_EN_IDX);
    printOut(P0);

    if (P0 & (1 << ADC_EN_IDX)) {
        printf("Enabled\n");
    } else {
        printf("Disabled\n");
    }

    // if ((P0 & (1 << ADC_EOC)) == 0) {
    if (checkBit(P0, (uint8_t)ADC_EOC)) {
        printf("Not Ready\n");
    } else {
        printf("Ready\n");
    }

    PORT0 p0;
    p0.U = 0x95;

    printf("Mode is %d\n", p0.R.MODE);
    printf("EN is %d\n", p0.R.EN);
    printf("EOC is %d\n", p0.R.EOC);

    return 0;
}