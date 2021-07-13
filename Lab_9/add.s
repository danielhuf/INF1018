/*
int add (int a, int b, int c) {
	return a+b+c;
}
*/

/* Dicionário:
	Reg  Variável
	%edi    a
	%esi    b
	%edx    c
*/

.text
.globl add
add:
	/* Registro de Ativação */
	pushq %rbp    /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp

INICIO:
	movl %edi, %eax
	addl %esi, %eax
	addl %edx, %eax

FIM:
	/* Nesse ponto, o valor a ser retornado já está no eax */
	movq %rbp, %rsp  /*destroi meu RA*/
	popq %rbp        /* restaura a base do RA da chamadora */
        /* esses dois comando poderiam ser substituídos por leave */
        ret
