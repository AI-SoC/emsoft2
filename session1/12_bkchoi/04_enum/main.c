#include <stdio.h>
typedef enum ADC_STATUS
{
    EOC=1<<3,
    SOC=1,
}ADC_STATUS;

enum TIMER_MODE
{
    TIMER_EN=(1<<7),//0b1xxx_xxxx
    TIMER_ST=(1<<3),//0bxxxx_1xxx
}TIMER_MODE;

ADC_STATUS adc_status()
{
    // if(read_adc())
    // return 1;2b0001
    // else
    // return 8;2b1000
    return EOC;
}

int main(void)
{
    printf("Running....\n");

    if (adc_status() == EOC)
    { // end of conversion(EOC)
        printf("ADC conversion finish\n");
    }

    // TMODE at 0xFFF0000 -> #deifne TMODE *((unsigned char*)0xFFFF0000)
    //*(0xFFFF0000) |=1<<7;
    // TMODE |=1<<7;
    unsigned char TMODE=0;
    TMODE|=TIMER_EN;
    TMODE|=TIMER_ST;
    printf("TMODE: 0x%2X\n",TMODE);

    return 0;
}