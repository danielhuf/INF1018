/*
double foo3 (double *a, int n) {
  int i;
  double r = 0.0;
  for (i=0; i<n; i++) {
    r += sin(*a);
    a++;
  }
  return r;
}
*/

.text
.globl foo3
foo3:
    	/* Registro de Ativação */
	pushq %rbp              /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp         /* Criando a base do meu RA */
	subq $32, %rsp          /* Abro espaço na pilha */
        movq %rbx, -8(%rbp)     /* salvando o valor de ebx da função chamadora no RA */

INICIO:
	movl $0, %ebx           /* ebx(i) = 0 */
	movq $0, %r10           /* r10 = 0 */
        cvtsi2sdq %r10, %xmm1   /* passa o valor de r10 para xmm1 (converte de long para double) */

FOR:
	cmpl %esi, %ebx         /* i::n? */
	jge FIM

	movsd %xmm1, -16(%rbp)  /* guarda xmm1 (r) na pilha */
	movq %rdi, -24(%rbp)    /* guarda primeiro argumento na pilha */
	movl %esi, -28(%rbp)    /* guarda segundo argumento na pilha */

	movsd (%rdi), %xmm0     /* xmm0 (primeiro argumento) = counteúdo de a (double) */
	call sin

	movsd -16(%rbp), %xmm1  /* restaura r */
	movq -24(%rbp), %rdi    /* restaura primeiro argumento */
	movl -28(%rbp), %esi    /* restaura segundo argumento */

	addsd %xmm0, %xmm1      /* xmm1 += resultado de sin(*a) */
	addq $8, %rdi           /* rdi++ (8 porque e um ponteiro */
	incl %ebx               /* i++ */
	jmp FOR

FIM:
	movsd %xmm1, %xmm0  /* xmm0 (valor de retorno) = r */
        movq -8(%rbp), %rbx     /* restaurando o ebx da função chamadora que estava no RA */
	leave
	ret
