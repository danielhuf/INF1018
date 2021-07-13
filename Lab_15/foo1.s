/*
float foo1 (float a, float b) {
  return sin(a) + b;
}
*/

.text
.globl foo1
foo1:
    	/* Registro de Ativação */
	pushq %rbp              /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp         /* Criando a base do meu RA */
	subq $16, %rsp          /* espaço na pilha para b */

        cvtss2sd %xmm0, %xmm0   /* converto a de float para double */
	cvtss2sd %xmm1, %xmm1   /* converto b de float para double */
	movsd %xmm1, -8(%rbp)   /* guarda b (xmm1 pode ser alterado quando chamo a função sin */
	call sin                /* chamo sin, que usa o primeiro argumento (a) */
	addsd -8(%rbp), %xmm0   /* xmm0 (valor de retorno) = xmm0 (seno de a) + xmm1 (b) */

	cvtsd2ss %xmm0, %xmm0   /* converto valor retorno de double para float */
	leave
	ret
