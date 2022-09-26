#include <stdio.h>
#define ID 12


extern int break1(int a);
int status;
static int flag;
const int k = 123;


int main() {
    
    printf("hello world %d\n",ID);
    status = 124;
    flag = 200;
    break1(ID*k);
    break1(ID*k);
    break1(ID*k);
    return 0;
}