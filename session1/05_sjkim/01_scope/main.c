#include <stdio.h>
#define ID 12

extern int break1(int a);

int status;

int k = 123;

int main(){
    printf("hello world %d\n", ID);
    status = 120;
    break1(ID*k);
    break1(ID*k);
    break1(ID*k);
    return 0;
}