/*
double pack1 (struct X1 *px, int n) {
  double acc = 0;
  int i;
  for (i=0;i<n;i++)
    acc += foo(px[i].vf, px[i].vi);
  return acc;
}
*/

/*
Campos da struct -> i i i i f f f f
Tamanho da struct = 8 bytes
*/

.text
.globl pack1
pack1:

	push %rbp
	movq %rsp, %rbp
	subq $32, %rsp           /* 8 bytes para rbx */  

	movq $0, %r10
        cvtsi2sdq %r10, %xmm0    /* acc = 0 */
	movl $0, %r11d           /* r11d(i) = 0 */

FOR:
	cmpl %esi, %r11d         /* ebx(i)::esi(n) ? */
	jge FIM

	movsd %xmm0, -8(%rbp)    /* salvando o xmm0 */
	movq %rdi, -16(%rbp)     /* salvando o rdi */
	movl %esi, -20(%rbp)     /* salvando o esi */
	movl %r11d, -24(%rbp)    /* salvando o r11d */

	imull $8, %r11d          /* r11d(i) = r11d * 8 (tamanho da struct) */
        movslq %r11d, %rdx       /* estendo r11d para 64 bits */
	addq %rdx, %rdi          /* rdi <- px[i] */
        movl (%rdi), %edi        /* edi (primeiro argumento) = px[i].vi */
        cvtss2sd 4(%rdi), %xmm0  /* xmm0 (primeiro argumento) = (double) px[i].vf */
        call foo
	
	addsd -8(%rbp), %xmm0    /* xmm0 (valor de retorno de foo) += acc */
        movq -16(%rbp), %rdi     /* restaura rdi */
	movl -20(%rbp), %esi     /* restaura esi */
	movl -24(%rbp), %r11d    /* restaura r11d */

	incl %r11d               /* i++ */
	jmp FOR

FIM:
        leave
        ret
