#include <stdio.h>

unsigned char rotate_left (unsigned char x, int n) {
    unsigned char y = x<<n;
    unsigned char z = x>>(8-n);
    unsigned char w = y|z;
    return w;
}

int main()
{
    unsigned char a = 0x61;
    unsigned char b = rotate_left(a,1);
    unsigned char c = rotate_left(a,2);
    unsigned char d = rotate_left(a,7);
    printf("%02x\n", b);
    printf("%02x\n", c);
    printf("%02x\n", d);
    return 0;
}