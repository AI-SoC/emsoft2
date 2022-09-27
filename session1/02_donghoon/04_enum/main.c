#include <stdio.h>

// 나중에 하드웨어가 바뀌면 아래 enum 정의된 부분만 바꾸면 되니까 간편하다!
// 이렇게 타입을 정의해주는게 습관이 되어야 한다.
// 개별값들의 상수값들을 제한하는 역할을 하기 때문에 안전하고 유용하다
typedef enum {
    EOC = 1<<3, //8, // end of conversion
    // 앞으로는 저렇게 shift 연산으로 작성하는 게 좋다
    SOC = 1 // start of conversion
} ADC_STATUS;

//
//
enum TIMER_MODE{
    TIMER_EN = (1<<7), // 0b1xxx_xxxx -> 기존값을 그대로 쓰고 해당 비트만 바꿔주는것
    TIMER_ST = (1<<3) // 0bxxxx_1xxx -> 얘도 1<<3만 1이고 나머지는 기존값 그대로
};



ADC_STATUS adc_status(){
    // if(read_abc())
    //  return 1; // 2b0001 --> 2진수 표현법
    // else
    //  return 8; // 2b1000 --> 2진수 표현법  
    return EOC;
};

int main(){
    printf("Running ... \n");
   
    if(adc_status() == EOC){ // end of conversion (EOC)
        printf("ADC conversion finish \n");
    }

    // #define TMODE 0xFFFF0000 에 타임 모드라고 정의되어있음
    // 여기에 접근하려면
    // *(0xFFFF0000) |= 1<<7; --> OR 연산을 통해서 접근해줘야 나머지값들이 0으로 안바뀌고 접근할수있음
    // *TMODE |= 1<<7;
    // 위처럼하면 타이머 enable

    //TMODE @ 0xFFFF0000 
    // --> #define TMODE *((unsigned char*)0xFFFF0000)
    // *(0xFFFF0000) |= 1<<7;
    //         TMODE |= 1<<7;
    //         TMODE |= TIMER_EN;

    unsigned char TMODE = 0;
    TMODE |= TIMER_EN;
    TMODE |= TIMER_ST;
    printf("TMODE: 0x%2X\n", TMODE);
    // TMODE = 0x00으로 되어있던거에 
    // OR로 0x10000000과
    // OR로 0x000010000이 되는 거니까 
    // 위처럼하면 10001000으로 나올테니까 0x88로 printf되게 된다.

    TMODE &= ~(TIMER_EN); 
    // 이렇게 하면
    // 1000000 -> 01111111 -> 이값에 &하는거니까 첫번째 비트만 클리어시킬수있다

    return 0;
}
