#include <stdio.h>

//#define ADC_DATA *((volatile unsigned char*)0xFF003355)
int adc_eoc_check(){
    //while (...) check EOC
    for (int i = 0; i<100000; i++); //software mode delay

    return 1;
}

int main() {
    printf("Running...\n");

#ifdef HW_REG
    // ADC_DATA = 3;
    // *(                        0xFF003355) = 3;
    // *((         unsigned int*)0xFF003355) = 3;
    // *((volatile unsigned int*)0xFF003355) = 3;
    // #define ADC_DATA *((volatile unsigned char*)0xFF003355)
    // ADC_DATA = 3;
#else
    volatile int ADC_DATA = 3;
#endif

    //wait for end of conversion
    while(adc_eoc_check() == 0);

    int voltage = ADC_DATA + 7;
    printf("voltage is %d\n", voltage);
 
    return 0;
}