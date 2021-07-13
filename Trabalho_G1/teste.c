#include <stdio.h>
#include "grava_structs.h"

struct s {
	short s1;
        int i2;
        int i1;   
        short s2;
};

int main()
{
    struct s exemplo[2] = {{0x0102, 0x01020304, 0x01020304, 0x0102}, {0x0102, 0x01020304, 0x01020304, 0x0102}};
    int res = grava_structs(2, exemplo, "siis", 'B', "saida1");
    dump_structs ("saida1");
    return 0;
}