#include <stdio.h>

/*
struct ADC_CONFIG {
    unsigned char CNFG1;
    unsigned char CNFG2;  
    unsigned short MODE;
};
*/

typedef struct {
    unsigned char b0 : 1;
    unsigned char b1 : 1;
    unsigned char b2 : 1;
    unsigned char b3 : 1;
    unsigned char b4 : 1;
    unsigned char b5 : 1;
    unsigned char b6 : 1;
    unsigned char b7 : 1;    
} bits8;

typedef struct {
    unsigned char CNFG1;
    unsigned char CNFG2;  
    unsigned short MODE;
} ADC_CONFIG;

typedef union {
    ADC_CONFIG adc; 
    unsigned char bytes[4];
    bits8         regs[4];
} flag_32bits;

void mem_inspection(unsigned char* p, int N) {
    printf("\n");
    for(int i=0; i<N; i++)
        printf("mem[%d] is 0x%02X at 0x%p\n", i, *(p+i), p+i);
}

int main() {
    printf("Running...\n");
    ADC_CONFIG adc1 = {0x01, 0x80, 0xF000};
    printf("adc1 is allocated at 0x%p with %d\n", &adc1, sizeof(adc1));
    printf("adc1.CNFG1 is 0x%2X at 0x%p\n", adc1.CNFG1, &(adc1.CNFG1));
    printf("adc1.CNFG2 is 0x%2X at 0x%p\n", adc1.CNFG2, &(adc1.CNFG2));
    printf("adc1.MODE is 0x%2X at 0x%p\n", adc1.MODE, &(adc1.MODE));
             
    unsigned char* adc_p = (unsigned char*)&adc1;
    mem_inspection(adc_p, sizeof(adc1));
    adc1.CNFG2 = 0xBB;
    mem_inspection(adc_p, sizeof(adc1));
    *(adc_p+1) = 0xCC;
    mem_inspection(adc_p, sizeof(adc1));
    *(adc_p+2) = 0x5A;
    mem_inspection(adc_p, sizeof(adc1));

    flag_32bits flag;
    printf("flag is allocated with %d bytes\n", sizeof(flag));

    flag.adc = adc1;
    printf("bytes[3] is 0x%02X\n", flag.bytes[3]);

    flag.bytes[1] = 0x5A;
    printf("CNFG2 is 0x%02X\n", flag.adc.CNFG2);

    printf("CNFG1.b0 is %d\n", flag.regs[0].b0);
    flag.regs[0].b1 = 1;
    flag.regs[0].b4 = 1;
    printf("CNFG1 is 0x%02X\n", flag.adc.CNFG1);

}