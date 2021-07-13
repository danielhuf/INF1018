/*
int foo (int x) {
	return x+1;
}
*/

/*
DICIONÁRIO
Reg      Variável   RA
EDI         x
EAX        x+1      valor de retorno
*/

.text
.globl foo
foo:
        /* Criar o RA  */
	pushq %rbp  /* salva a base do RA da função chamadora */
        movq %rsp, %rbp

INICIO:
	incl %edi        /* incremento o primeiro argumento da função */
        movl %edi, %eax  /* passo para o valor de retorno */

FIM:
	leave
	ret
