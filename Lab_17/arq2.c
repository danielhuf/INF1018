#include <stdio.h>
#include <string.h>

int g(char *s1, char *s2);

int i = 0;
int k = 0;
char s1[] = "ola";
char s2[] = " mundo";

int f(char *p) {
  return strlen(p);	
}

int main() {
  int j;
  j = g(s1, s2);
  printf("%d",j);
 }