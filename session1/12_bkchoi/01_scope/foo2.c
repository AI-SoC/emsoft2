#include <stdio.h>

extern int status;
int flag = 12;
// int try=0;

int break1(int a)
{
    static int try = 0;
    if (status == 124)
        printf("mode1: \n");
    else
        printf("mode2: \n");
    try++;
    printf("breaking %d (Ver 1.2) %d times try\n", a, try);
    printf("flag is %d\n", flag);
    return 0;
}