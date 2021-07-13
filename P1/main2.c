#include <stdio.h>

struct Sim
{
	int cc;
  char s;
  short tp;
  struct Sim *prox;
};

int boo(int n, struct Sim *p);

int main()
{
  struct Sim sim[2] = {{1, 2, 3, &sim[1]}, {4, 5, 6, NULL}};
  int i = boo(2, sim);
  printf("%d", i);
}