#include <stdio.h>

struct X1 {
  char c1;
  int i;
  char c2;
} x1 = {0xc1, 0x01020304, 0xc2};

struct X2 {
  long l;
  char c;
} x2 = {0x0102030405060708, 0xc1};

struct X3 {
  int i;
  char c1;
  char c2;
} x3 = {0x01020304, 0xc1, 0xc2};

struct X4 {
  struct X2 x;
  char c;
} x4 = {{0x0102030405060708, 0xc1}, 0xc2};

struct X5 {
  char c1;
  char c2;
  char c3;
} x5 = {0xc1, 0xc2, 0xc3};

struct X6 {
  short s1;
  int i;
  char c[3];
  short s2;
} x6 = {0x0102, 0x01020304, {0xc1, 0xc2, 0xc3}, 0x0102};

union U1 {
  int i;
  char c[5];
};

union U2 {
  short s;
  char c[5];
};

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main(void) {
    int i;

    union U1 u1;
    union U2 u2;

printf("\nx1:\n");
    dump(&x1, sizeof(x1));
printf("\nx2:\n");
    dump(&x2, sizeof(x2));
printf("\nx3:\n");
    dump(&x3, sizeof(x3));
printf("\nx4:\n");
    dump(&x4, sizeof(x4));
printf("\nx5:\n");
    dump(&x5, sizeof(x5));
printf("\nx6:\n");
    dump(&x6, sizeof(x6));

    u1.i = 0x01020304;
printf("\nu1 (int)\n");
    dump(&u1, sizeof(u1));
    for (i = 0; i <5; i++)
      u1.c[i] = 0xcc;
printf("u1 (char)\n");
    dump(&u1, sizeof(u1));

    u2.s = 0x0102;
printf("\nu2 (short)\n");
    dump(&u2, sizeof(u2));
    for (i = 0; i <5; i++)
      u2.c[i] = 0xcc;
printf("u2 (char)\n");
    dump(&u2, sizeof(u2));
  return 0;
}
