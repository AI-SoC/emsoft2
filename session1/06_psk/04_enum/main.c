
#include <stdio.h>

typedef enum {
    EOC = 1<<3,
    SOC = 1
} ADC_STATUS;

enum TIMER_MODE {
    TIMER_EN = (1<<7),
    TIMER_ST = (1<<3)
};

ADC_STATUS adc_status(){
    return EOC;
}

int main() {
    printf("Running...\n");

    if(adc_status() == EOC){    //end of conversion (EOC)
        printf("ADC conversion finish\n");
    }

    // #define TMODE 0xFFFF0000
    //      -> #define TMODE *((unsigned char*)0xFFFF0000)
    // *(0xFFFF0000) |= 1<<7;
    //         TMODE |= 1<<7;
    //         TMODE |= TIMER_EN;

    unsigned char TMODE = 0;
    TMODE |= TIMER_EN;
    TMODE |= TIMER_ST;
    printf("TMODE : 0x%2X\n", TMODE);

    TMODE &= ~(TIMER_EN);

    return 0;
}