#include <stdio.h>
#define ID 12
// 현재파일에 Makefile이 없어서 이 상태로 빌드하면에러뜸
// Makefile 생성해주면 됨

/* 유의사항 gcc 입력부에 tab으로 간격 벌려서 작성해줘야 함
all:
	gcc -o main main.c
	./main
*/

// 다른파일 어딘가에 정의되어있던 함수를 가져오겠다는 것.
extern int break1(int a);

int status;
static int flag; // static을 쓰면 이 변수는 바깥으로 넘어가지 않는다 
                // 안전을 위해서 static을 사용함
                // 다른 파일에서 flag를 쓰더라도 다른 메모리 공간이라 이상이 없다.

const int k = 123; // const라서 선언하게 되면
                    // 오버라이드 안되고 임베디드에서 속도가 확 빨라진다

int main (){
    printf("hello world %d\n",ID);
    status = 120;
    flag = 200;

    break1(ID*k);
    break1(ID*k);
    break1(ID*k);

    return 0;
}