#include <stdio.h>

#define ADC_EN_IDX 4
#define ADC_EOC 7

typedef struct _bits8 {
    unsigned char b0 : 1;
    unsigned char b1 : 1;
    unsigned char b2 : 1;
    unsigned char b3 : 1;
    unsigned char b4 : 1;
    unsigned char b5 : 1;
    unsigned char b6 : 1;
    unsigned char b7 : 1;
}bits8;

typedef struct _adc_reg {
    unsigned char MODE   : 4;
    unsigned char EN     : 1;
    unsigned char _NA    : 2;
    unsigned char EOC    : 1;
}adc_reg;
// 이렇게 되면 아래처럼 8bit가 설정됨
// _   _ _ _  _ _ _ _
// EOC _ _ EN MODE


typedef union _PORT0 {
    unsigned char   U;  // writing
    bits8           B;  // Access bit Slice
    adc_reg         R;  // Acces Reg Field
} PORT0;

int main(){
    printf("Running ... \n");

    unsigned char p0 = 0x95;
    p0 &= ~(1<<ADC_EN_IDX);
    printf("P0: 0x%02X \n", p0);

    // 해당 bit가 1인지를 체크하는 방법은 1로 AND를 취하는 것.
    // Disable ADC
    if( p0 & (1<<ADC_EN_IDX)){
        printf("ADC is Enabled \n");
    }
    else{
        printf("ADC is Disabled \n");
    }


    // Enable ADC
    p0 |= (1<<ADC_EN_IDX);
    if( p0 & (1<<ADC_EN_IDX)){
        printf("ADC is Enabled \n");
    }
    else{
        printf("ADC is Disabled \n");
    }

    //check EOC
    // 0x80 하게되면 칩 세팅 바뀌면 다시 다 세팅해줘야하니
    // 0으로 비교하는게 유리하다
    //if(p0 & (1<<ADC_EOC) == 0x80){
    if((p0 & (1<<ADC_EOC)) == 0 ){
         printf("ADC is still on conversion \n");       
    } else {
        printf("ADC is ready \n");
    }

    //--------------------------------------------------
    PORT0 pp0;
    pp0.U = 0x93;
    printf("Mode is %d \n", pp0.R.MODE);
    if(pp0.R.EN)
        printf("ADC is Enabled \n");
    else
        printf("ADC is Disabled \n");

    return 0;
}
