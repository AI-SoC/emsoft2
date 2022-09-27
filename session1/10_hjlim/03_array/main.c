#include <stdint.h>
#include <stdio.h>

void print_array(int32_t arr[], int32_t n) {
    for (int i = 0; i < n; i++)
        printf("arr[%d] is %d @ %p\n", i, arr[i], &arr[i]);
}

int main(void) {
    printf("Running...\n");

    uint32_t arr[] = {0, 1, 2, 3, 4};
    printf("arr is allocated with %d bytes @ %p\n", sizeof(arr), arr);

    // for (int i = 0; i < 5; i++)
    //     printf("arr[%d] is %d @ %p\n", i, arr[i], &arr[i]);

    // for (int i = 0; i < 5; i++)
    //     printf("arr[%d] is %d @ %p\n", i, *(arr + i), arr + i);
    print_array(arr, sizeof(arr) / sizeof(arr[0]));
    return 0;
}