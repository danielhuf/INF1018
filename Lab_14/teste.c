#include <stdio.h>

int main(void) {
	float f;
	int i;

	i = 1342177301;
	printf("i antes = %d\n", i);
	f = i;
	printf("valor de f = %f\n", f);
	i = f;
	printf("i depois = %d\n", i);
}

/* Com isso, vemos que o float não é capaz de representar o número com a mesma precisão do inteiro */
/* int = 31 bits (tirando 1 do sinal), float = 24 bits (23 + 1 bit implicito da mantissa) */