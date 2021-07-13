#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main (void) {
  /*int i = 10000;
  long a = 10000;
  short b = 10000;*/
  char c = 'a';
  char d = 97;
  /*dump(&i, sizeof(i));
  dump(&a, sizeof(a));
  dump(&b, sizeof(b));*/
  dump(&c, sizeof(c));
  dump(&d, sizeof(d));
  return 0;
}

