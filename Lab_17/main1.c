#include <stdio.h>
void dump(void *p, int n) {
  unsigned char *p1 = (unsigned char *)p;
  while (n--) {
    printf("%p - %02x\n",p1,*p1);
    p1++;
  }
}

struct X {
  double d;
  float  f;
  short  s;
} x = {-4.5, 9.75, -11};

int main(void) {
  dump(&x, sizeof(x));
  return 0;
}