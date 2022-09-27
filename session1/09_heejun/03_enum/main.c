#include <stdio.h>
typedef enum {
    EOC = 1<<3,
    SOC = 1
} ADC_STATUS;

enum TIMER_MODE {
    TIMER_EN = (1<<7), // 0b1xxx_xxxx
    TIMER_ST = (1<<3) // 0bxxxx_1xxx
};

int adc_status() {
    // if ( read_ad() )
    //   return 1; 2b0001
    // else
    //   return 8; 2b1000
    return EOC ;
}

ADC_STATUS main () {
    printf("Running...\n");
    
    if (adc_status() == 8) // end of conversion (EOC)
        printf("ADC Conversion finish\n");
    // # TMODE @ 0xFFFF000
    // -> #define TMODE *((unsigned char*)0xFFF0000)
    // *(0xFFFF000) |= 1<<7;
    // TMODE |= 1<<7;
    // TMODE |= TIMER_en;
    unsigned char TMODE = 0 ;
    TMODE |=TIMER_EN;
    TMODE |=TIMER_ST;
    printf("TMODE: 0x%2X\n", TMODE);

    TMODE &= ~(TIMER_EN);
    
    return 0;
    }
