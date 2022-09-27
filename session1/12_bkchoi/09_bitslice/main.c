#include <stdio.h>
#define ADC_EN_IDX 4
#define ADC_EOC 7

typedef struct bits8
{
    /* data */
    unsigned char b0 : 1;
    unsigned char b1 : 1;
    unsigned char b2 : 1;
    unsigned char b3 : 1;
    unsigned char b4 : 1;
    unsigned char b5 : 1;
    unsigned char b6 : 1;
    unsigned char b7 : 1;
} bits8;

typedef struct adc_reg
{
    /* data */
    unsigned char MODE : 4;
    unsigned char EN : 1;
    unsigned char _NA : 2;
    unsigned char EOC : 1;
} adc_reg;

typedef union PORT0
{
    /* data */
    unsigned char U; // writing
    bits8 B;         // access bit slice
    adc_reg R;       // access reg field
} PORT0;

int main(void)
{
    printf("Running....\n");

    unsigned char P0 = 0x95;
    P0 &= ~(1 << ADC_EN_IDX); // setting pattern

    printf("P0: 0x%02X\n", P0);

    if (P0 & (1 << ADC_EN_IDX)) // check pattern
    {
        printf("ADC is Enabled\n");
    }
    else
    {
        printf("ADC is Disabled\n");
    }

    // setting pattern(enable ADC)
    P0 |= (1 << ADC_EN_IDX); // setting pattern

    printf("P0: 0x%02X\n", P0);

    if (P0 & (1 << ADC_EN_IDX)) // check pattern
    {
        printf("ADC is Enabled\n");
    }
    else
    {
        printf("ADC is Disabled\n");
    }

    // setting pattern(enable ADC)
    P0 |= (1 << ADC_EN_IDX); // setting pattern

    printf("P0: 0x%02X\n", P0);

    // if ((P0 & (1 << ADC_EOC))==0x80) // check pattern
    if ((P0 & (1 << ADC_EOC)) == 0)
    {
        printf("ADC is not ready\n");
    }
    else
    {
        printf("ADC is ready\n");
    }

    PORT0 p0;
    p0.U = 0x93;
    printf("Mode is %d\n", p0.R.MODE);
    if (p0.R.EN)
        printf("ADC is enabled\n");
    p0.R.EN = 0;
    if (p0.R.EN)
        printf("ADC is enabled\n");
    else
        printf("ADC is disabled\n");

    p0.U &=~(0x0F);//reset to 0
    p0.U |=(0x03);




    return 0;
}