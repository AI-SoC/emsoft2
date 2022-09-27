#include <stdio.h>

// #define ADC_DATA *((unsigned char*)0xFF003355)  원래는 이렇게 짠다?
// #define ADC_DATA *((volatile unsigned char*)0xFF003355)   HW를 가리킬 때는 써줘야한다.

int adc_eoc_check() {
    // while ( ... ) check EOC
    for(int i=0; i<100000; i++); // software mode delay
    return 1;
}

int main(){
    printf("Running...\n");

    volatile int ADC_DATA = 3;
    // wait for end of conversion
    while(adc_eoc_check() == 0);

    int voltage = ADC_DATA + 7;
    printf("voltage is %d\n", voltage);

    return 0;
}