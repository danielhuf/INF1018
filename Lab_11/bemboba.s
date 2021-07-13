/*
int bemboba (int num) {
  int local[4];
  int *a;
  int i;

  for (i=0,a=local;i<4;i++) {
    *a = num;
    a++;
  }
  return addl (local, 4);
}
*/

.text
.globl bemboba
bemboba: 
	/* Registro de Ativação */ 
	pushq %rbp /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/ 
	movq %rsp, %rbp /* Criando a base do meu RA */ 
	subq $16, %rsp /* abrindo espaço no RA */ 

INICIO: 
	movl $0, %r10d /* i = 0 */ 
	leaq -16(%rbp), %r11 /* a = local */ 

FOR: 
	cmpl $4, %r10d /* i::4? */ 
	jge FORA_FOR 

	movl %edi, (%r11) /* *a = num */
	addq $4, %r11 /* a++ */ 

	incl %r10d /* i++ */
	jmp FOR 

FORA_FOR: 
	leaq -16(%rbp), %rdi /* rdi (primeiro parâmetro) = local */
	movl $4, %esi /* esi (segundo parametro) = 4 */ 
	call addl 

FIM: 
	leave 
	ret

