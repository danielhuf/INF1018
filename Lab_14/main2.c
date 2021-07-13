#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define getsig(x)        ((x)>>31 & 1)
#define getexp(x)        ((x)>>23 & 0xff)
#define getfrac(x)       ((x) & 0x7fffff)
#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))

typedef union {
  float f;
  unsigned int i;
} U;

unsigned maiorExpBase2(int n)
{
    unsigned expo = 0;
    while ((n/pow(2, expo)>=1))
        expo++;
    return (expo-1);
}

float int2float(int i) {
	unsigned absoluto = abs(i), sinal, exp, frac, frac_incompleto, e, bias = 127;
	U u;

	if (i == 0)
		return 0.0;
	if (i>0)
		sinal = 0;
	else
		sinal = 1;

	e = maiorExpBase2(absoluto);
	exp = e + bias;

	frac_incompleto = absoluto - pow(2,e);    /* Em binário: frac = M - 1 */
	if (e<=23)
		/* número de 0´s a completar na direita = 23-e */ 
		frac = frac_incompleto * pow(2,(23-e));   /* ou frac = frac_incompleto<<(23-e) */  
	else
		/* número de posições a andar para a direita do numero maior que 23 bits = e-23 */ 
		frac = frac_incompleto / pow(2,(e-23));   /* ou frac = frac_incompleto>>(e-23) */

	u.i = makefloat(sinal, exp, frac);
	return u.f;
}

int main() {
   int i;

   printf("\n******** int2float ****************\n");
   i = 0;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 1;  
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -1;  
   printf(" %d -> %10.4f\n", i, int2float(i));
   i = 0x7fffffff;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -i;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 86118465;          /*esse número tem 27 bits (mais que 23) e é não periódico: 101001000100001000001000001 */
   printf(" %d -> %+10.4f\n", i, int2float(i));
   return 0;
}