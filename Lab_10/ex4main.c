#include <stdio.h>
#define N 10

void map2 (int *um, int *outro, int n);

int f (int x) { return x+2; }

int main (void) {
  int i;
  int a[N], b[N];
  for (i=0;i<N;i++)
    a[i] = i;
  map2(a,b,N);
  for (i=0;i<N;i++)
    printf("%d\n",b[i]);
  return 1;
}