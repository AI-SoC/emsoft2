#include <stdio.h>

typedef enum{
    EOC = 1<<3, //1를 3번 shift => 0x1000 => 8
    SOC = 1
} ADC_STATUS;

enum TIMER_MODE {
    TIMER_EN = (1<<7), // 0b1xxx_xxxx 기존 값은 그대로 두고 해당 비트만 바꾸어 준다.
    TIMER_ST = (1<<3) // 0bxxxx_1xxx
};

ADC_STATUS adc_status(){
    // if (read_adc())
    // return 1;  2b0001
    // else
    // return 8;  2b1000
    return EOC;

}

int main() {

    printf("Running...\n");
    if(adc_status() == EOC) {//end of conversion (EOC)
        printf("ADC conversion finish \n");
    }
    // TMOME @ 0xFFFF0000 
    // -> #define TMODE *((unsinged char*) 0xFFFF0000)
    // *(0xFFFF0000) |= 1<<7; //7번째 Bit 가 timer enable
    //         TMODE |= 1<<7;
    //         TMODE |= TIMER_EN;
    unsigned char TMODE = 0;
    TMODE |= TIMER_EN;
    TMODE |= TIMER_ST;
    printf("TMODE: 0x%2x\n", TMODE);

    TMODE &= ~(TIMER_EN);
    return 0;
}