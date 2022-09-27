#include <stdio.h>

typedef struct ADC_CONFIG
{
    unsigned char CNFG1;
    unsigned char CNFG2;
    unsigned short MODE;
}ADC_CONFIG;


int main(void)
{
    printf("Running....\n");

    ADC_CONFIG adc1={0x01,0x80,0xF000};
    printf("adc1 is allocated at 0x%p with %d",&adc1,sizeof(adc1));
    printf("adc1.CNFG1 is at %p, value is 0x%02X\n",&(adc1.CNFG1),adc1.CNFG1);
    printf("adc1.CNFG1 is at %p, value is 0x%02X\n",&(adc1.CNFG2),adc1.CNFG2);
    printf("adc1.CNFG1 is at %p, value is 0x%02X\n",&(adc1.MODE),adc1.MODE);

    return 0;
}