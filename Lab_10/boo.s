/*
struct X {
  int val1;
  int val2;
};

int f(int i, int v);

void boo (struct X *px, int n, int val) {
  while (n--) {
    px->val2 = f(px->val1, val);
    px++;
  }
}
*/

/*
DICIONÁRIO
REG      VARIÁVEL
%rdi        px                ponteiro para struct do tipo x
%esi        n
%edx        val
*/

.text
.globl boo
boo:
    	/* Registro de Ativação */
	pushq %rbp /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp    /* Criando a base do meu RA */
        subq $16, %rsp   

WHILE:    
       cmpl $0, %esi    /* esi (n) == 0? */
       je FIM

       movq %rdi, -8(%rbp)
       movl %esi, -12(%rbp)
       movl %edx, -16(%rbp)

       movl %edx, %esi       /* segundo parâmetro da próxima função passa a receber terceiro parâmetro (val) de boo */
       call f                /* chamo f, rdi já está certo e esi já foi ajeitado */

       movq -8(%rbp), %rdi
       movl -12(%rbp), %esi
       movl -16(%rbp), %edx

       movl %eax, 4(%rdi)   /* 4(%rdi) (x->val2) = retorno de f */

       addq $8, %rdi       /* px++ */   
       decl %esi  /* n-- */
       jmp WHILE

FIM:
       leave
       ret



