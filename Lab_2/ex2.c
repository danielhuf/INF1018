#include <ctype.h>
#include <stdio.h>

int string2num (char *s, int base) {
  int a = 0;
  for (; *s; s++)
    if (isdigit(*s))
        a = a*base + (*s - '0');
    else
        a = a*base + (*s - 'a' + 10);
  return a;
}

int main (void) {
  /*printf("==> %d\n", string2num("1234"));
  printf("==> %d\n", string2num("1234") + 1);
  printf("==> %d\n", string2num("1234") + string2num("1"));
  printf("%d\n", string2num("777", 8));
  printf("%d\n", string2num("777", 10));*/
  printf("%d\n", string2num("1a", 16));
  printf("%d\n", string2num("a09b", 16));
  printf("%d\n", string2num("z09b", 36));
  return 0;
}