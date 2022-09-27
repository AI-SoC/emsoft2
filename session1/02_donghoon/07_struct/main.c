#include <stdio.h>
// 구조체 연습 진행
// 아래 처럼 구조체 선언하게 되면 메모리가 설정되는가?
// 선언만 한것이기 때문에 메모리 할당은 되지 않는다!!!!!
// 그래서 변수로 선언해줘야 메모리가 할당되게된다.
/*
struct ADC_CONFIG{
    unsigned char CNFG1;
    unsigned char CNFG2;
    unsigned short MODE;
};
*/

typedef struct _bits8{
    unsigned char b0 : 1; //  이렇게 하면 1비트 슬라이스가 가능하다
    unsigned char b1 : 1;
    unsigned char b2 : 1;
    unsigned char b3 : 1;
    unsigned char b4 : 1;
    unsigned char b5 : 1;
    unsigned char b6 : 1;
    unsigned char b7 : 1;

}bits8;


typedef struct _ADC_CONFIG{
    unsigned char CNFG1;
    unsigned char CNFG2;
    unsigned short MODE;
} ADC_CONFIG;

// 공용체!!
typedef union _flag_32bits{
    ADC_CONFIG      adc;
    unsigned char   bytes[4];
    bits8           regs[4];
} flag_32bits;


void mem_inspection(unsigned char* p, int N){
    for(int i=0; i<N ; i++)
    {
        printf("mem[%d] is 0x%02X at 0x%p\n", i, *(p+i), p+i);
    }

}

int main(){
    printf("Running ... \n");

    ADC_CONFIG adc1 = {0x01, 0x80, 0xF000};
    printf("adc1 is allocated at 0x%p with %d \n", &adc1, sizeof(adc1));
    // 위 구조체에서 타입 byte 누적만큼 size가 생성

    printf("adc1.CNFG1 is %02X at 0x%p \n",adc1.CNFG1, &(adc1.CNFG1));
    printf("adc1.CNFG2 is %02X at 0x%p \n",adc1.CNFG2, &(adc1.CNFG2));
    printf("adc1.MODE is %02X at 0x%p \n",adc1.MODE, &(adc1.MODE));

    // little 인지 big endian인지 확인하려면
    // char 형태로 casting하면 된다

    unsigned char* adc_p = (unsigned char*)&adc1;
    mem_inspection(adc_p, sizeof(adc1));

    adc1.CNFG2 = 0xBB;
    mem_inspection(adc_p, sizeof(adc1));

    *(adc_p+1) = 0xCC;
    mem_inspection(adc_p, sizeof(adc1));
    *(adc_p+2) = 0x5A;
    mem_inspection(adc_p, sizeof(adc1));

    flag_32bits flag;
    printf("flag is allocated with %d bytes \n", sizeof(flag));

    flag.adc = adc1;
    printf("bytes[3] is 0x%02X \n", flag.bytes[3]);

    flag.bytes[1] = 0x5A;
    printf("CNFG2 is 0x%02X \n", flag.adc.CNFG2);

    printf("CNFG1.b0 is %d \n", flag.regs[0].b0);


    flag.regs[0].b1 = 1;
    flag.regs[0].b4 = 1;
    printf("CNFG1 is 0x%02X \n", flag.adc.CNFG1);    



    return 0;
}
