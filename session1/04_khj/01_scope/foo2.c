#include <stdio.h>

//w/o extern, error duplicate

extern int status;
int flag = 0; 


int break1(int a)
{
    static int try = 0;
    if (status == 124)
        printf("mode1: ");
    else
        printf("mode2: ");

    try++;

    printf("breaking %d (Ver1.2) %d times\n", a, try);
    printf("flag %d\n", flag);
    return 0;
}