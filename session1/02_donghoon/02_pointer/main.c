#include <stdio.h>

int main(){

    printf("Running ... \n");

    int a = 10;
    int b = 20;
    int c = 0x12345678;

    printf("a is %d at 0x%p\n", a, &a);
    printf("a is %d at 0x%p\n", b, &b); //주소값 확인하려면 %p를 사용한다
    printf("a is 0x%8X at 0x%p\n", c, &c); //%8X -> 헥사로 8자리 표현하는 방법
    // 확인해보면 주소값이 4byte씩 차이가 나는 걸 알 수 있다
    // 그리고 최상위 변수로 부터 값이 계속 작아진다! 스택에 위에서부터 차례대로 저장되기때문
    
    int* ap = &a; // 변수 a라는 주소를 저장하기위해
                    // int 형태의 포인터 변수를 저장함
    *ap = 200; // 포인터 변수(ap가 가르키는 메모리)에 접근할때에는 
                    //*(변수명) 이렇게 해서 사용한다
                    //*(&a) --> 결국 상쇄돼서 a = 200이되는 것.
    //printf("a is %d at 0x%p\n", a, &a); 아래랑 동일한 것 
    printf("*ap is %d at 0x%p\n", *ap, &*ap);

    int* cp = &c;
    printf("cp is 0x%8X at 0x%p\n", *cp, &c);

    // int* cp라는건 어떤 주소이고 어떤 영역을 가리키는걸 4byte로 정의되어있음
    // 아래처럼 *mcp는 결국 cp가 가리키는 대상중 0x12만 가리킴
    // 이렇게 되면 1byte 단위로 관리가 가능한다.
    unsigned char* mcp = (unsigned char*)cp;
    // little endian -> 작은게 아래 0x78 -> 0x56 -> 0x34 -> 0x12
    // big endian -> 큰게 아래 0x12 -> 0x34 -> 0x56 -> 0x78
    printf("%p | %2X\n", (mcp+0), *(mcp+0));
    printf("%p | %2X\n", (mcp+1), *(mcp+1));
    printf("%p | %2X\n", (mcp+2), *(mcp+2));
    printf("%p | %2X\n", (mcp+3), *(mcp+3));

    *(mcp+1) = 0x88;
     printf("%p | %2X\n", (mcp+0), *(mcp+0));
    printf("%p | %2X\n", (mcp+1), *(mcp+1));
    printf("%p | %2X\n", (mcp+2), *(mcp+2));
    printf("%p | %2X\n", (mcp+3), *(mcp+3));  
     
    return 0;
}
