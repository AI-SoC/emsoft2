#include <stdio.h>

#define ADC_EN_IDX 4
#define ADC_EOC    7

struct bits8
{
    unsigned char b0: 1;
    unsigned char b1: 1;
    unsigned char b2: 1;
    unsigned char b3: 1;
    unsigned char b4: 1;
    unsigned char b5: 1;
    unsigned char b6: 1;
    unsigned char b7: 1;
};

struct adc_reg
{
    unsigned char MODE: 4;
    unsigned char EN: 1;
    unsigned char NA: 2;
    unsigned char EOC: 1;
};

typedef union PORT0 
{
    unsigned char U; //writing 
    struct bits8  B; //Access bit slice
    struct adc_reg R; //Access Reg Field 
}PORT0;


int main()
{
    printf("Running...\n");
   
    unsigned char P0 = 0X95;
    //disable ADC
    P0 &= ~(1<<ADC_EN_IDX);

    printf ("P0: 0X%02X\n", P0);

    if (P0 & (1<<ADC_EN_IDX))
    {
        printf("ADC is Enabled\n");
    }
    else
    {
        printf("ADC is Disabled\n");
    }

    //enable ADC
     P0 |= (1<<ADC_EN_IDX);

    printf ("P0: 0X%02X\n", P0);

   
    if (P0 & (1<<ADC_EN_IDX))
    {
        printf("ADC is Enabled\n");
    }
    else
    {
        printf("ADC is Disabled\n");
    }

    //Check EOC
    //    if (P0 & (1<<ADC_EOC) == 0x80)
    if((P0 & (1<<ADC_EOC)) == 0)
    {
        printf("ADC is still on conversion\n");
    }
    else
    {
        printf("ADC is ready\n");
    }

    PORT0 p0;
    p0.U = 0x93;
    printf("Mode is %d\n", p0.R.MODE);
    if(p0.R.EN)
        printf("ADC is enabled\n");
    else
        printf("ADC is disabled\n");
    
    p0.U &= ~(0X0F);
    P0.U |= 0X03;



}



