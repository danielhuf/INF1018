#include <stdio.h>

long foo(int v[], int n);

int main()
{
    int v[5] = {2,2,2,2,2};
    printf("%ld", foo(v, 5));

    return 0;
}