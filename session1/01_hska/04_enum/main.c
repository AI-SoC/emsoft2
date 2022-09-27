#include <stdio.h>

//enum을 이용하여 값의 종류를 제한 가능
//만약 HW 사양이 바뀌면 enum내용물만 바꾸어주면 쉽게 코드 관리가 가능해짐

typedef enum {
    EOC = 1 << 3,
    SOC = 1
} ADC_STATUS;


// 
enum TIMER_MODE{
    TIMER_EN = (1<<7), // ob1000_0000
    TIMER_ST = (1<<3) // 0bxxxx_1xxx

};



ADC_STATUS adc_status(){
    // if(read_adc() )
    //  return 1;   2b0001
    // else
    //  return 8;   2b1000


    return EOC;
}


int main()  {
    printf("Running...\n");

    if(adc_status() == EOC)   // end of conversion (EOC) 
    {
        printf("ADC Conversion finish\n");
    }

    // #define TMODE 0xFFFF0000 -> #define TMODE *((unsigned char *)0xFFFF0000)
    // *(0xFFFF0000) |= 1<<7 ; // low level hard coding
    // TMODE |= 1<<7;
    // TMODE |= TIMER_EN;
    unsigned char TMODE = 0;
    TMODE |= TIMER_EN;
    TMODE |= TIMER_ST;
    printf("TMODE: 0x%2X\n", TMODE);

    TMODE &= ~(TIMER_EN);
    printf("TMODE: 0x%2X\n", TMODE);

    return 0;
}

