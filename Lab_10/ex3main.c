#include <stdio.h>
struct X {
  int val1;
  int val2;
};

int boo (struct X *px, int n, int val);

int f(int i, int v) {
  if (i >= v)
    return i;
  else
    return v;
}

int main (void) {
  struct X x[3] = {{1,0}, {2,0}, {3,0}};
  int i;

  printf("Antes: ");
  for (i=0; i < 3; i++)
    printf("{%d,%d} ",x[i].val1, x[i].val2);
  boo(x,3,2);
  printf("\nDepois: ");
  for (i=0; i < 3; i++)
    printf("{%d,%d} ",x[i].val1, x[i].val2);
  printf("\n");
  return 0;
}