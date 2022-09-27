#include <memory.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

void detect_v1(int a, char b) { printf("detect_v1() is activated\n"); }

void detect_v2(int a, char b) { printf("detect_v2() is activated\n"); }

void (*fun_ptr)(int, char);
int main(void) {
    printf("Running...\n");
    fun_ptr = detect_v2;
    detect_v1(10, 3);
    fun_ptr(10, 3);
}