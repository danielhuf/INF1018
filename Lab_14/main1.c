#include <stdio.h>

/* Uma macro é analisada durante a pré-compilação, é diferente de função */

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))
                    /* &1 pra pegar só 0 ou 1   & 0xff pra pegar só 8 bits 1 dela   &0x7ffffff pra pegar 23 bits 1 */

#define getsig(x)  ((x)>>31 & 1)
#define getexp(x)  ((x)>>23 & 0xff)
#define getfrac(x) ((x) & 0x7fffff)

typedef union { 
  float f;
  unsigned int i;
 } U;

/* Retorna o valor de f multiplicado por 2 */
float float2(float f) {
	unsigned sinal, expoente, fracao;   // mesma coisa que unsigned int
	/*s = getsig(f);    -> não podemos dazer isso, porque a operação bit a bit não funciona com floats*/
	U u;

	u.f = f;
	sinal = getsig(u.i);    //u.i contem os mesmos bits que u.f (que contem o float de parâmetro)
        expoente = getexp(u.i);
        fracao = getfrac(u.i);

	printf("Sinal = %d, Expoente = %02X, Fração = %03X\n", sinal, expoente, fracao);

	expoente++;   // 2*2^y = 2*(y+1)

	u.i = makefloat(sinal, expoente, fracao);
	return u.f;
}


/* Retorna o valor de f dividido por 2 */
float divide2(float f) {
	unsigned sinal, expoente, fracao;   // mesma coisa que unsigned int
	/*s = getsig(f);    -> não podemos dazer isso, porque a operação bit a bit não funciona com inteiros */
	U u;

	u.f = f;
	sinal = getsig(u.i);    //u.i contem os mesmos bits que u.f (que contem o float de parâmetro)
        expoente = getexp(u.i);
        fracao = getfrac(u.i);

	printf("Sinal = %d, Expoente = %02X, Fração = %03X\n", sinal, expoente, fracao);

	expoente--;   // 2*2^y = 2*(y+1)

	u.i = makefloat(sinal, expoente, fracao);
	return u.f;
}

int main(void) {
	float valor;
	valor = 15213.0;
	printf("Antes = %f\n", valor);
	//valor = float2(valor);
	//printf("Depois = %f\n", valor);
	valor = divide2(valor);
	printf("Depois = %f\n", valor);
	return 0;
}