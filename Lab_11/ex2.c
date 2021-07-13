#include <stdio.h>

int addl (int a[], int n) {
  int i;
  int s = 0;
  for (i=0; i<n; i++)
    s += a[i];
  return s;
}

int bemboba (int num);

int main (void) {
  printf ("%d\n", bemboba(5));
  return 0;
}