#include <stdio.h>


#define ADC_EN_IDX 4
#define ADC_EOC    7

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
    unsigned char EN   : 1;
    unsigned char _NA  : 2;
    unsigned char EOC  : 1;
};
typedef union PORT0 {
    unsigned char  U; //Write
    struct bits8   B; //Access bit slice
    struct adc_reg R; //Access Reg Field
}PORT0;

int main() {
    printf("Running...\n");

    //Disable ADC
    unsigned char P0 = 0x95;
    P0 &= ~(1<<ADC_EN_IDX);
    printf("P0: 0x%02X\n", P0);

    if(P0 &(1<<ADC_EN_IDX)){
        printf("ADC is Enabled \n");
    }
    else{
        printf("ADC is Disabled \n");
    }

    //Enable ADC
    P0 |= (1<<ADC_EN_IDX);
    printf("P0: 0x%02X\n", P0);

    if(P0 &(1<<ADC_EN_IDX)){
        printf("ADC is Enabled \n");
    }
    else{
        printf("ADC is Disabled \n");
    }

    //Check EOC
    //if(P0 &(1<<ADC_EOC) >> 7 ){
    if((P0 &(1<<ADC_EOC)) == 0 ){
        printf("ADC is still on conversion \n");
    }
    else{
        printf("ADC is ready \n");
    }
    PORT0 p0;
    p0.U = 0x93;
    printf("Mode is %d\n", p0.R.MODE);
    p0.R.EN = 0;
    if(p0.R.EN)
        printf("ADC is Enabled\n");


    p0.U &= ~(0x0F); //Clear
    p0.U |= 0x03;


}