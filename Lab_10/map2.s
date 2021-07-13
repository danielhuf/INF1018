/*
int f(int x);

void map2 (int* um, int * outro, int n) {
  int i;
  for (i=0; i<n; i++)
    *(outro+i) = f(*(um+i));
}
*/

.text
.globl map2
map2:
    	/* Registro de Ativação */
	pushq %rbp /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp    /* Criando a base do meu RA */
        subq $32, %rsp
        movq %rbx, -8(%rbp)

INICIO:
       movl $0, %ebx      /* i=0 */

FOR:
       cmpl %edx, %ebx  /* i::n? */
       jge FIM

       /*OBS: *(outro+i) = outro[i] */
       movslq %ebx, %r10    /* estendo ebx para 64 bits */
       imulq $4, %r10       /*r10 = 4*i */
       addq %rsi, %r10      /* r10 <- &outro[i] */

       /*OBS: *(um+i) = um[i] */
       movslq %ebx, %r11   /* estendo para 64 bits */
       imulq $4, %r11      /* r11 = 4*i */
       addq %rdi, %r11     /* r11 <- &um[i] */

       movq %rdi, -16(%rbp)
       movq %rsi, -24(%rbp)
       movl %edx, -28(%rbp)
       
       movq (%r11), %edi
       call f

       movq -16(%rbp), %rdi
       movq -24(%rbp), %rsi
       movl -28(%rbp), %edx

       movl %eax, (%r10)     /* *(outro+i) = retorno de f */
       incl %ebx   /* i++ */
       jmp FOR

FIM:
       movq -8(%rbp), %rbx
       leave
       ret



