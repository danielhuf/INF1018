/*
int foo2 (int x) {
	return add(x);
}
*/

/*
DICIONÁRIO
Reg      Variável   RA
EDI         x
EAX        x+1      valor de retorno
*/

.text
.globl foo2
foo2:
        /* Criar o RA  */
	pushq %rbp  /* salva a base do RA da função chamadora */
        movq %rsp, %rbp

        call add    /* primeiro parametro EDI (já está) e mover valor retornado para eax (já está) */

	leave
	ret
