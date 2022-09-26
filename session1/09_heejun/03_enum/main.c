#include <stdio.h>
typedef enum {
    EOC = 8,
    SOC = 1
} ADC_STATUS;

int adc_status() {
    // if ( read_adc() )
    //   return 1; 2b0001
    // else
    //   return 8; 2b1000
    return EOC ;
}

ADC_STATUS main () {
    printf("Running...\n");
    
    if (adc_status() == 8) // end of conversion (EOC)
        printf("ADC Conversion finish\n");
    
    }
