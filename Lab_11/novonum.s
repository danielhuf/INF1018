/*
int novonum(void) {
  int minhalocal;
  printf("numero: ");
  scanf("%d",&minhalocal);
  return minhalocal;
}
*/

.data
Sf1: .string "numero: "
Sf2: .string "%d"

.text
.globl novonum
novonum:
    	/* Registro de Ativação */
	pushq %rbp              /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp         /* Criando a base do meu RA */
        subq $16, %rsp          /* abrindo espaço no RA */

PRINTF:
	movq    $Sf1, %rdi    /* primeiro parametro (ponteiro)*/
	call  printf          /* chama a funcao da biblioteca */

SCANF:
	movq $Sf2, %rdi       /* rdi = "%d" */
	leaq -4(%rbp), %rsi   /* rsi = &i -> calcula o endereço de -4(%rbp) e coloca em %rsi */
        call scanf
        movl -4(%rbp), %eax   /* eax (valor retorno) = i */

FIM:
	leave
	ret
