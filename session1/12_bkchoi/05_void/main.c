#include <stdio.h>

int compare_int(int a, int b)
{
    return a == b;
}

int compare(int type, void *ap, void *bp)
{
    if (type == 0)
    {
        // int compare
        int *a = (int *)ap;
        int *b = (int *)bp;
        return *a == *b;
    }
    else if (type == 1)
    {
        // int compare
        double *a = (double *)ap;
        double *b = (double *)bp;
        return *a == *b;
    }
}

int main(void)
{
    printf("Running....\n");

    int a = 10;
    int b = 10;
    if (compare_int(a, b) == 1)
        printf("a b is same\n");

    return 0;
}