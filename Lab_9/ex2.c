#include <stdio.h>

int fat(int n);

int main(void) {
	int num;
	printf("Entre com um numero: ");
	scanf("%d",&num);
	printf("O fatorial de %d é %d\n", num, fat(num));
        return 0;
}