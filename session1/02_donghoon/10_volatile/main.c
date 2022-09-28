#include <stdio.h>

// 하드웨어를 가리킬때에는 volatile을 사용한다
// volatile는 스스로 바뀔 수 있는 변수에 대해서 사용하게 되는데
// 해당 기능을 사용하지 않으면 컴파일러는 변하지 않는 변수라고 단정하게 된다.
// 그래서 memory를 읽고 확인해야하는 과정이 생략될수있어서 유의!

// #define ADC_DATA *((volatile unsigned char*)0xFF003355)  // SPEC을 보고 이렇게 데이터를 읽어오는게 정석
// 다음 수업부터에는 하드웨어 스펙을 보고 위 처럼 세팅해줘야한다.


int adc_eoc_check(){
    //while(...) --> 이전에 EOC Check했던 코드
    for (int i=0; i<100000; i++); // software mode delay

    return 1;
};

int main(){
    printf("Running ... \n");

    volatile int ADC_DATA = 3;
    // 위에 하드웨어 스펙대로 설정한다면
    // 바로 ADC_DATA = 3으로 사용가능
    // 또는 *(                        0xFF003355) = 3;
    // 또는 *((         unsigned int*)0xFF003355) = 3;
    // 또는 *((volatile unsigned int*)0xFF003355) = 3;
    // 
    // 그런데 매번 저렇게 선언하기 힘드니까
    // 맨 앞에다가 
    // #define ADC_DATA *((volatile unsigned int*)0xFF003355) 선언 후
    // ADC_DATA = 3; 으로 하는 것이 좋다!


    // volatile 선언하는 순간 위 변수는 바뀔 수 있는 변수이기 때문에
    // load 할때 값을 확인해야한다는 점을 명시하기 위해서 volatile을 사용하는 것이다
    
    
    // wait for end of conversion
    while(adc_eoc_check() == 0);    // 결과가 끝날때까지 기다리는 테크닉임.

    int voltage = ADC_DATA + 7;
    printf("voltage is %d \n", voltage);

    return 0;
}
