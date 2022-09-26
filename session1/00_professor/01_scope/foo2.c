#include <stdio.h>

extern int status;
int flag = 12;
int break1(int a) {
    int try;
    if(status == 124) 
        printf("mode1: ");
    else
        printf("mode2: ");

    try++;
    printf("breaking %d (Ver 1.2) %d times\n", a, try);
    printf("flag %d\n", flag);

    return a;
}