#include <stdio.h>

int odd_ones (unsigned int x) {
    int c;
    for (c=0;x;) {   //Será feiro n vezes, sendo n = sizeof(unsigned int), enquanto x!=00000000
        if (x&1)     //Pensar nisso como (x & 00000001)
            c=c^1;
        x = x>>1;
    }
    return c;
}

int main() {
  printf("%x tem numero %s de bits 1\n",0x01010101,odd_ones(0x01010101) ? "impar":"par");
  printf("%x tem numero %s de bits 1\n",0x01030101,odd_ones(0x01030101) ? "impar":"par");
  return 0;
}