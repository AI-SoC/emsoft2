#include <stdio.h>

int compare_int(int a, int b){
    return a==b;
}

int main(){
    printf("Running...\n");

    int a = 10;
    int b = 10;
    if(compare_int(a,b)==1)
        printf("a b is same\n");

    return 0;
}