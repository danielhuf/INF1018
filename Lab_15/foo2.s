/*
double foo2 (float a, float b) {
  return sin(a) + cos(b);
}
*/

.text
.globl foo2
foo2:
    	/* Registro de Ativação */
	pushq %rbp              /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp         /* Criando a base do meu RA */
	subq $16, %rsp          /* Abro espaço na pilha */

        cvtss2sd %xmm0, %xmm0   /* converto a de float para double */
	cvtss2sd %xmm1, %xmm1   /* converto b de float para double */
	movsd %xmm1, -8(%rbp)   /* guarda b (xmm1 pode ser alterado quando chamo a função sin */
	call sin                /* chamo sin, que usa o primeiro argumento (a) */
	movsd %xmm0, -16(%rbp)  /* guarda resultado de sin(a) */
	movsd -8(%rbp), %xmm0   /* xmm0 (primeiro argumento) = b */
	call cos                /* chamo cos, que usa o primeiro argumento (b) */
	addsd -16(%rbp), %xmm0   /* xmm0 (valor de retorno) = xmm0 (cosseno de b) + seno de a */

	leave
	ret
