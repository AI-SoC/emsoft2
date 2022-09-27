#include <stdio.h>

void detect_v1(int a, char b)
{
    // do something ..
    //..
    printf("detect_v1() is activated\n");
}

void detect_v2(int a, char b)
{
    // do something ..
    //..
    printf("detect_v2() is activated\n");
}

void (*fn_p)(int, char);
//함수가 만들어질 것은 알고 있고, 다른 팀/부서에서 해당 함수를 작성할때,
//미리 메모리 영역을 구성해두고, 알려주면 조건에 따라 함수의 시작위치로 가서 실행이 된다.
//windows에서는 dll과 같음.
//혹은 partial update를 위해 미리 메모리 공백을 만들어두고, 특정 조건이 되면
//해당 함수 영역으로 jump한다.
int main(void)
{
    printf("Running....\n");

    int cond = 1;

    if (cond == 1)
        fn_p = detect_v1;
    else if (cond == 2)
        fn_p = detect_v2;

    fn_p(10, 3);

    return 0;
}