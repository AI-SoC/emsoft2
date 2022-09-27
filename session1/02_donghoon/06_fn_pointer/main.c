#include <stdio.h>

// 이코드는 non-volatile 에 들어가는데 
// 비활성화라고 하더라도 시간지나면 사라지는 부분이 있어서 self check가 필요하다 
void detect_v1(int a, char b){
    // do something...
    // ...
    printf("detect_v1() is activated \n");

}

void detect_v2(int a, char b){
    // do something...
    // ...
    printf("detect_v2() is activated \n");

}

void (*fn_p)(int, char);

int main(){
    printf("Running ... \n");

    // 함수도 시작주소가 있음
    // 함수이름은 함수의 시작 주소를 의미한다
    printf("-------------------------\n");
    detect_v1(10, 3);
    printf("-------------------------\n");

    int cond = 1;
    if(cond == 1)
    {
        fn_p = detect_v1;
    }
    else
    {
        fn_p = detect_v2;
    }
     // 함수 주소를 가리키니까 함수 포인터가 된다.
    // 함수를 가리키기 위한 타입 선언이 필요한다
    // 함수의 경우 함수를 설명하는 정보가 많아
    // return 타입, argument 종류 타입 개수 등..

    fn_p(10, 3); // 이렇게 호출해도 동일한 결과가 나온다
    // 이렇게 하면 예를들어
    // 리콜 대비해서
    // 저렇게 v1, v2 만들어 놓고 빌드를 미리 해놓고
    // fn_p의 주소를 v1에서 v2로 바꾸면 (하드코딩으로 바꿔도되고 flag로 바꿔도 되고)
    // 추가적인 작업없이 리던던시 확보가 가능한다


    return 0;
}
