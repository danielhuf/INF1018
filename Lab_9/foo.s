/*
void foo (int a[], int n) {
  int i;
  int s = 0;
  for (i=0; i<n; i++) {
    s += a[i];
    if (a[i] == 0) {
      a[i] = s;
      s = 0;
    }
  }
}
*/

/* Dicionário:
	Reg  Variável
	%rdi    a[]
	%esi    n
*/

.text
.globl foo
foo:
	/* Registro de Ativação */
	pushq %rbp    /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp
        /* O CÓDIGO ANTES FUNCIONAVA SEM ESSAS 3 LINHAS DE AGORA, MAS O MELHOR É COLOCÁ-LAS MESMO */
        /* NA REAL EU NÃO PECISO COLOCÁ-LAS PORQUE EU NÃO ESTOU CHAMANDO OUTRA FUNÇÃO, ENTÃO EU NÃO PRECSIO SALVAR TAIS REGITSRADORES */
        subq $16, %rsp        
        movl %rbx, -8(%rbp)   /* salvando o valor de rbx da função chamadora no RA , rbx é calle saved, e acabaremos alterando %ebx */

INICIO:
        movl $0, %ebx   /*ebx (s) = 0 */
        movl $0, %ecx   /*ecx (i) = 0 */

INICIO_FOR:
        cmpl %esi, %ecx  /* ecx == eci? */
        jge FIM

        movl $4, %edx      /*edx = 4 */
        imull %ecx, %edx   /*edx = 4*i */
        movslq %edx, %rdx  /* estendo edx para 64 bits */
        movq %rdi, %r12    /* r12 = rdi (recebe a[]) */
        addq %rdx, %r12    /* endereço é somado */ 
        addl (%r12), %ebx   /* ebx (s) é somado com valor inteiro */

        cmpl $0, (%r12)    /* a[i] == 0? */
        jne FIM_FOR
        movl %ebx, (%r12)   /* a[i] = s */
        movl $0, %ebx      /* s=0 */
        
FIM_FOR:
        addl $1, %ecx  /* ecx++ (i++) */
        jmp INICIO_FOR

FIM:
        movl -8(%rbp), %rbx /* restaurando o ebx da função chamadora que estava no RA */ 
        leave
        ret
