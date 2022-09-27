#include <stdio.h>
void detect_v1(int a, char b){
    // do something
    //
    printf("detect_v1() is activated\n");
}

void (*fn_p)(int, char); // function 포인터

int main () {
    printf("Running...\n");
    detect_v1(10,3);

    int cond = 1;
    if( cond ==1)
        fn_p = detect_v2;
    else
        fn_p = detect_v1; 
    
    fn_p = detect_v1; // 함수를 가르키기 위한 타입이 필요
    fn_p(10, 3);

    
    }
