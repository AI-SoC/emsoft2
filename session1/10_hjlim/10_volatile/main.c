#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

int adc_eoc_check() {
    // while ( ... ) check EOC
    for (int i = 0; i < 1000000; i++)
        ;
    return 1;
}

int main(void) {
    printf("Running ... \n");

    // ADC_DATA = 3;
    // *(                         0xFF003355) = 3;
    // *((          unsigned int*)0xFF003355) = 3;
    // *((volatile unsiigned int*)0xFF003355) = 3;
    //
    // #define ADC_DATA *((volatile unsigned int*)0xFF003355)
    // int ADC_DATA = 3;

    volatile int ADC_DATA = 3;
    int voltage = ADC_DATA + 7;
    while (adc_eoc_check() == 0)
        ;
    printf("voltage is %d\n", voltage);

    return 0;
}