#include <stdio.h>
#define ID 12

extern int break1(int a);
int status;
static int flag;
const int k=123;

int main()
{
    // int ID=12;
    printf("hello world, id=%d\n", ID);
    status = 120;
    flag=200;
    break1(ID*k);
    break1(ID*k);
    break1(ID*k);
    break1(ID*k);
    break1(ID*k);
    return 0;
}