#include <stdint.h>
#include <stdio.h>

typedef enum { EOC = 1 << 3, SOC = 1 << 0 } ADC_STATUS;

enum TIMER_MODE { TIME_EN = 1 << 7, TIME_START = 1 << 3 };

ADC_STATUS adc_status() {
    // if(read_adc())

    return EOC;
}

int main(void) {
    printf("Running...\n");

    if (adc_status() == EOC) { // EOC
        printf("ADC conversion finish\n");
    }

#define TMODE_ADDR *((uint8_t *)0xFFFF0000)

    uint8_t TMODE = 0;
    TMODE |= TIME_EN;
    TMODE |= TIME_START;

    printf("TMODE: 0x%2X\n", TMODE);
    // TMODE_ADDR |= TIME_EN;
    // TMODE_ADDR |= TIME_START;

    return 0;
}