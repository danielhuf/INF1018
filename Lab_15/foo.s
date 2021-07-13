/*
float foo (double a, float b) {
  return (a+b)*(a-b);
}
*/

.text
.globl foo
foo:
    	/* Registro de Ativação */
	pushq %rbp              /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp         /* Criando a base do meu RA */

	cvtss2sd %xmm1, %xmm1   /* converto b de float para double */
	movsd %xmm0, %xmm2      /* guardo o double a em xmm2 */
	addsd %xmm1, %xmm0      /* xmm0 = a+b */
	subsd %xmm1, %xmm2      /* xmm2 = xmm2(a) - b */
        mulsd %xmm2, %xmm0      /* xmm0 (valor de retorno) = xmmo(a+b) * xmm2(a-b) */

	cvtsd2ss %xmm0, %xmm0   /* converto valor retorno de double para float */
	leave
	ret
