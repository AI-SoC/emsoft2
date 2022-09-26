#include <stdio.h>

int print_array(int *arr, int N)
{
    printf("print_array----------\n");
    for (int i = 0; i < N; ++i)
        printf("arr[%d] is %d at %p\n", i, arr[i], &arr[i]);
}
int main(void)
{
    printf("Running...\n");

    unsigned int arr[5] = {0, 1, 2, 3, 4};

    printf("arr is allocated with %d bytes at %p\n", sizeof(arr), arr);
    for (int i = 0; i < 5; ++i)
        printf("arr[%d] is %d at %p\n", i, *(arr + i), arr + i);

    printf("\n");

    for (int i = 0; i < 5; ++i)
        printf("arr[%d] is %d at %p\n", i, arr[i], &arr[i]);

    printf("\n\n\n");

    print_array(arr, sizeof(arr)/sizeof(int));
    return 0;
}