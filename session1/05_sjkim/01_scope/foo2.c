#include <stdio.h>

extern int status;

int break1(int a){
    static int try=0;
    if(status == 124)
        printf("mode1: ");
    else
        printf("mode2: ");

    try++;
    printf("breaking %d (Ver 1.2) %d times\n", a, try);
    return a;
}