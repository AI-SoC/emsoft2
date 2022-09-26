
#include <stdio.h>

int flag=12;
extern int status;

int break1(int a){
    static int try = 1;
    if(status == 124)
        printf("mode1: \n");
    else
        printf("mode2: \n");
    try++;
    printf("try : %d\n", try);
    printf("breaking %d (Ver 2)\n", a);
    printf("flag %d\n", flag);
    return a;
}