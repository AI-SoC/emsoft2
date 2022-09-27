#include <stdio.h>


/*
struct ADC_CONFIG {
    unsigned char CNFG1;
    unsigned char CNFG2;
    unsigned short MODE;


};
*/

#define ADC_EN_IDX  4
#define ADC_EOC     7

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
    unsigned char MODE : 4;
    unsigned char EN : 1;
    unsigned char _NA : 2;
    unsigned char EOC : 1;

};

typedef union {
    unsigned char   U;  // Writing
    struct bits8    B;  // Access bit slice
    struct adc_reg  R;  // Access Reg Field
}PORT0;


int main()  {
    printf("Running...\n");

    unsigned char P0 = 0x95;  //0x1000 0101
    
    // 해당bit disable
    P0 &= ~ (1<<ADC_EN_IDX);

    printf("P0: 0x%02X\n",P0);

    if(P0 & (1<<ADC_EN_IDX)){   //해당비트가 1인지 확인하는 방법
        printf("ADC is enabled\n");
    }
    else
    {
        printf("ADC is disenabled\n");
    }

    // Enable ADC
     P0 |= (1<<ADC_EN_IDX);

    printf("P0: 0x%02X\n",P0);

    if(P0 & (1<<ADC_EN_IDX)){   //해당비트가 1인지 확인하는 방법
        printf("ADC is enabled\n");
    }
    else
    {
        printf("ADC is disenabled\n");
    }

    // Check EOC
    printf("P0: 0x%02X\n",P0);

    if( (P0 & (1<<ADC_EOC)) == 0){
    //if( (P0 & (1<<ADC_EOC)) == 0x80){   //해당비트가 1인지 확인하는 방법
        printf("ADC is still on conversion\n");
    }
    else
    {
        printf("ADC is ready\n");
    }

    PORT0 p0;
    p0.U = 0x93;  // 1001 0011
    printf("Mode is %d\n",p0.R.MODE);
    p0.R.EN = 0;
    if(p0.R.EN)
        printf("ADC is enabled\n");
    else
        printf("ADC is disenabled\n");

    p0.U &= ~(0x0F);
    p0.U |= 0x03;
    
    return 0;
}

