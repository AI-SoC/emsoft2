#include <stdio.h>

void detect_v1(int a, char b){
    // do something..
    // ..
    static int i = 0;
    printf("detect_v1() is activate%d\n", i++);
}
void detect_v2(int a, char b){
    // do something..
    // ..
    static int i = 0;
    printf("detect_v2() is activate%d\n", i++);
}

void (*fn_p)(int, char);


int main() {
    printf("Running...\n");
    detect_v1(10, 3);
    int cond = 1;
    if(cond == 1)
        fn_p = detect_v2;
    else
        fn_p = detect_v1;

    fn_p(10, 3);




    return 0;
}