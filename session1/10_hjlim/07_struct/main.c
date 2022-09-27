#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

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

typedef struct _ADC_CONFIG {
    uint8_t CNFG1;
    uint8_t CNFG2;
    uint16_t MODE;
} ADC_CONFIG;

typedef union _flag_16bits {
    ADC_CONFIG adc;
    uint8_t bytes[4];
    bits8 regs[4];
} flag_32bits;

void mem_inspection(uint8_t *p, int N) {
    for (int i = 0; i < N; i++)
        printf("mem[%d] - 0x%02X at %p.\n", i, *(p + i), p + i);
}

int main(void) {
    ADC_CONFIG adc1 = {0x01, 0x80, 0xF000};
    uint8_t *padc = (uint8_t *)&adc1;
    printf("Running ... \n");
    printf("adc1 is allocated at 0x%p %d \n", &adc1, sizeof(adc1));
    printf("adc1.CFNG1 0x%02X is allocated at 0x%p \n", adc1.CNFG1,
           &adc1.CNFG1);
    printf("adc1.CFNG2 0x%02X is allocated at 0x%p \n", adc1.CNFG2,
           &adc1.CNFG2);
    printf("adc1.MODE 0x%04X is allocated at 0x%p \n", adc1.MODE, &adc1.MODE);

    adc1.CNFG2 = 0xBB;
    *(padc + 1) = 0xCC;
    mem_inspection((uint8_t *)&adc1, sizeof(adc1));

    flag_32bits flag;

    flag.adc = adc1;
    printf("bytes[3] is 0x%02X\n", flag.bytes[3]);
    flag.bytes[1] = 0x5A;
    printf("flag.adc.CFNG1 0x%02X is allocated at 0x%p \n", flag.adc.CNFG1,
           &flag.adc.CNFG1);
    printf("flag.adc.CFNG2 0x%02X is allocated at 0x%p \n", flag.adc.CNFG2,
           &flag.adc.CNFG2);

    bits8 bit8;
    bit8.b2 = 1;
    printf("%d \n", bit8);

    flag.regs[0].b0 = 1;
    flag.regs[0].b4 = 1;

    return 0;
}