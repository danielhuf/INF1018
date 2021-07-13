/* 
int fat (int n) {
	if (n==0) return 1;
	else return n*fat(n-1);
}
*/

/*
Dicionário
Reg   Variáveis   Registro de Ativação
%edi  n           -4
*/

.text
.globl fat
fat:
	/* Registro de ativação:
		- salvar o RA da função chamadora
		- criar o meu RA
	*/
	pushq %rbp           /* salva o RA da chamadora */
	movq  %rsp, %rbp     /* criando a base do meu RA */
	subq  $16, %rsp	     /* abrir espaço para meu RA, o número deve ser sempre múltiplo de 16, mesmo que estejamos guardando menos (nesse caso só 4 bytes)*/

INICIO:
	cmpl  $0, %edi       /* n==0? */
	jne   ELSE

	movl  $1, %eax
	jmp FIM

ELSE:
	movl %edi, -4(%rbp)  /* Salvando o n no -4 do RA. Poderia ser -8 tbm, contanto que haja espaço para tudo */
	decl %edi  /* edi = edi-1 */
	call fat	
	movl -4(%rbp), %edi   /*restaura o valor de n para edi */
	imull %edi, %eax      /* valor retornado pela função = valor retornado pela função*n */

FIM:
	leave
	ret
