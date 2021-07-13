#include <stdio.h>

unsigned char switch_byte (unsigned char x) {
    unsigned char y = x<<4;    
    unsigned char z = x>>4;  
    unsigned char w = y|z;
    return w;
}

int main() {
    unsigned char x = 0xAB;
    unsigned char y = switch_byte(x);
    printf("%02x", y);
    return 0;
}