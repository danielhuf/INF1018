#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%d ", *p1);
    p1++;
  }
  printf("\n");
}

int main (void) {
  char p[] = "A";
  char q[] = " ";
  char r[] = "\n";
  char s[] = "$";
  dump(p, sizeof(p));
  dump(q, sizeof(q));
  dump(r, sizeof(r));
  dump(s, sizeof(s));
  return 0;
}