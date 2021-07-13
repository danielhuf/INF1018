/*
double pack (struct X *px) {
  double acc = 0;
  while (px != NULL) {
    acc += foo(px->vd, px->vi);
    px = px->next;
  }
  return acc;
}
*/

/* 
DICIONARIO
Reg          Variavel      RA
%rdi           *px         -8
%xmm0          acc         -16

Campos da struct -> i i i i x x x x d d d d d d d d next next next next next next next next
*/

.text
.globl pack
pack:
	push %rbp
	movq %rsp, %rbp
	subq $16, %rsp           /* usarei 8 bytes do rdi (ponteiro) e 8 bytes do xmm0 (double) */

	movq $0, %r10
        cvtsi2sdq %r10, %xmm0    /* acc = 0 */

WHILE:
	cmpq $0, %rdi            /* px::0 (NULL)? */
	je FIM 

	movq %rdi, -8(%rbp)      /* salvando o rdi */
	movsd %xmm0, -16(%rbp)   /* salvando o xmm0 */

	movsd 8(%rdi), %xmm0     /* xmm0 (primeiro argumento) recebe px->vd */
        movl (%rdi), %edi        /* edi (primeiro argumento) recebe px->vi */
	call foo                 /* retorna valor em %xmm0 */

	addsd -16(%rbp), %xmm0   /* valor de retorno = valor de retorno + acc */
	movq -8(%rbp), %rdi      /* restaurando edi */

	movq 16(%rdi), %rdi      /* px = px->next */
	jmp WHILE

FIM:
	leave
	ret
