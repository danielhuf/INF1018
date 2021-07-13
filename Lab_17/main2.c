#include <stdio.h>

double foo (double a, int b);

int main(void) {
  printf("%f\n", foo(2.5, 2));
  printf("%f\n", foo(2.5, -2));
  printf("%f\n", foo(-2.5, 2));
  printf("%f\n", foo(-2.5, -2));
  return 0;
}