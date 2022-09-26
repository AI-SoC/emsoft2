#include <stdio.h>
#define ID 13

extern int break1(int a);
int status;
static int flag;
const int k = 123;

int main(void) {
    printf("Hello world %d\n", ID);
    status = 124;
    flag = 200;
    break1(ID * k);
    break1(ID * k);
    break1(ID * k);
    return 0;
}