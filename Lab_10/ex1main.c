#include <stdio.h>
#include <stdlib.h>
#define MAX 10 /* MAX tem que ser maior que 1!!!! */

struct X {
  int val;
  struct X *next;
};

int add (struct X *x);

int main (void) {

  struct X x[MAX];
  int i;

  for (i=0;i<MAX;i++)
    x[i].val = i;

  for (i=MAX-1;i>1;i--)
    x[i].next = &(x[i-1]);
  x[0].next = &(x[MAX-1]);
  x[1].next = NULL;

  printf ("resultado de add: %d\n", add(x));
  return 0;
}