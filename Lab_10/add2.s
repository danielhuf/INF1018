/*
#include <stdlib.h>

struct X {
  int val;
  struct X *next;
};

int add2 (struct X *x) {
  if (x == NULL) return 0;
  else return x->val + add2(x->next);
}
*/

/* Não precisaremos criar uma structs, pois ela é uma definição para o compilador. Em assembly, a struct não é necessária */

/*
DICIONÁRIO
Reg    Variável     RA
RIP                         próxima instrução
RSP                         ponteiro para o topo da pilha
RBP                         ponteiro para a base do meu RA
RDI       x                 ponteiro para a struct do tipo x (primeiro parametro)
*/

.text
.globl add2
add2:
	/* Registro de Ativação */
	pushq %rbp /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp    /* Criando a base do meu RA */
        subq $16, %rsp
        movq %rbx, -8(%rbp)   /* salvando o valor de ebx da função chamadora no RA, poderia tbm fazer movl %ebx, -4(%rbp) */

INICIO:
       cmpq $0, %rdi    /* x == NULL? */
       jne ELSE

       movl $0, %eax   /* eax = 0 */
       jmp FIM

ELSE:
       movl (%rdi), %ebx     /* ebx = x->val */
       movq 8(%rdi), %rdi    /* rdi <- (rdi+8) */
       call add2            /* chamo add2, que retorna %eax */
       addl %ebx, %eax    /* eax = eax (retorno da ultima chamada de add2) + x->val */

FIM:
       movq -8(%rbp), %rbx /* restaurando o ebx da função chamadora que estava no RA */
       leave
       ret


	
