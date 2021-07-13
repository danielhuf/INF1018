/*
#include <stdlib.h>

struct X {
  int val;
  struct X *next;
};

int add (struct X *x) {
  int a = 0;
  for (; x != NULL; x = x->next)
    a += x->val;
  return a;
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
ESI       a                 (poderia ser qualquer registrador)
*/

.text
.globl add
add:
	/* Registro de Ativação */
	pushq %rbp /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp    /* Criando a base do meu RA */

INICIO:
	movl $0, %esi    /* a=0 */
	/* o for não tem a parte inicial */

DENTRO_DO_FOR:
	cmpq $0, %rdi     /* x == NULL? (NULL é interpretado como 0) */
	je FORA_DO_FOR
	addl (%rdi), %esi /* Desenho da struct-> val val val val x x x x next next next next next next next next */
                          /* a = a+(*x) */
        movq 8(%rdi), %rdi  /* rdi <- (rdi + 8) */ /* Estou movendo rdi 8 endereços depois (pra pegar o next da próxima), tambem poderia ser addq $8, %rdi + movq (%rdi), %rdi*/
	jmp DENTRO_DO_FOR

FORA_DO_FOR:
	movl %esi, %eax    /* eax é o valor de retorno. No fim das contas ele poderia ter sido utilizado desde o início */
	leave
        ret
	
