
#include <stdio.h>

void detect_v1(int a, char b){
    printf("detect_v1() is activated\n");
}

void detect_v2(int a, char b){
    printf("detect_v2() is activated\n");
}

void (*fn_p)(int, char);

int main() {
    printf("Running...\n");

    detect_v1(10,3);

    fn_p = detect_v2;

    fn_p(10,3);

    return 0;
}