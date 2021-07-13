#include <stdio.h>

void foo (int a[], int n);

int main()
{
    int a[] = {1,0,3,4,0};
    foo (a, 5);
    printf("%d\n", a[0]);
    printf("%d\n", a[1]);
    printf("%d\n", a[2]);
    printf("%d\n", a[3]);
    printf("%d\n", a[4]);
    return 0;
}