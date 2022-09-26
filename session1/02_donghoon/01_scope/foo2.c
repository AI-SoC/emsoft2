#include <stdio.h>

extern int status;
int flag = 12;
//int try = 0;

int break1(int a){
//    int try = 0; // 이건 스택 메모리에 저장한건데 이경우
                    // 함수가 끝나면 지워졌다가 다시 만들어져서 0에서 계속 다시시작함
    static int try = 0; // 이렇게 static 으로 선언하게 되면
                        // 이 함수영역에서만 글로벌 변수와 같이 수행되게 된다
                        // 모양은 재 실행될때 초기화될것처럼 보이지만 
                        // 초기값만 사용되고 나머지는 전역변수처럼 사용되는 것으로 보임
    if (status == 124)
        printf("mode1: ");
    else
        printf("mode2: ");
    
    try++;

    printf("breaking %d (Ver 1.2) %d times\n",a,try);
    printf("flag %d",flag);


    return a;
};
