#include <stdio.h>
#define ADC_EN_IDX 4
#define ADC_EOC 7
struct bits8{
    unsigned char b0 : 1;
    unsigned char b1 : 1;
    unsigned char b2 : 1;
    unsigned char b3 : 1;
    unsigned char b4 : 1;
    unsigned char b5 : 1;
    unsigned char b6 : 1;
    unsigned char b7 : 1;
};
struct adc_reg{
    unsigned char MODE  : 4;
    unsigned char EN    : 1;
    unsigned char _NA   : 2;
    unsigned char EOC   : 1;
};

typedef union {
    unsigned char U; // Writing
    struct bits8 B; // Access bit slice
    struct adc_reg R; // Access Ref field
}PORT0;

int main() {
    printf("Running...\n");

    unsigned char p0 = 0x95;
    // Disable ADC
    p0 &= ~(1<<ADC_EN_IDX);

    printf("p0: 0x%02X\n", p0);
    if(p0 &(1<<ADC_EN_IDX))
        printf("ADC is Enabled\n");
    else
        printf("ADC is Disabled\n");

    // Enable ADC
    p0 |= (1<<ADC_EN_IDX);

    printf("p0: 0x%02X\n", p0);
    if(p0 & (1<<ADC_EN_IDX))
        printf("ADC is Enabled\n");
    else
        printf("ADC is Disabled\n");

    
    // Check EOC
    if((p0 & (1<<ADC_EOC)) == 0)
        printf("ADC is not ready\n");
    else
        printf("ADC is ready\n");

    
    printf("p0: 0x%02X\n", p0);


    PORT0 P0;
    P0.U = 0x93;
    printf("Mode is %d\n", P0.R.MODE);

    P0.R.EN = 0;
    
    if(P0.R.EN)
        printf("ADC is enabled\n");
    else
        printf("ADC is disabled\n");

    return 0;
}
