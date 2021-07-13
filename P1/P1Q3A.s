/*
long foo(int v[], int n)
{
   int i;
   long s = 0;
   for (i=0; i<n; i++) 
   {
       if (v[i]<0)
       v[i] = 0;

       s += (long) v[i];
    }
    return s;
}
*/

/*
DICIONÁRIO

Reg       Variável  Descrição
RIP                    próxima instrução
RSP                    ponteiro para topo da pilha
RBP                    ponteiro para base do meu RA
rdi         v[]
esi         n
rbx         s
r12d        i
r10         i estendido
rax         retorno (long)
*/

.text
.globl foo
foo:
    	/* Registro de Ativação */
	pushq %rbp              /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp         /* Criando a base do meu RA */
        subq $16, %rsp          /* abrindo espaço no RA */
        movq %rbx, -8(%rbp)     /* salvando o valor de ebx da função chamadora no RA */
        movq %r12, -16(%rbp)    /* salvando o valor de r12 da função chamadora no RA */

INICIO:
       movq $0, %rbx      /* s=0 */
       movl $0, %r12d     /* i=0 */

FOR:
       cmpl %esi, %r12d  /* i::n? */
       jge FIM

       movslq %r12d, %r10    /* estendo ebx para 64 bits */
       imulq $4, %r10        /*r10 = 4*i */
       addq %rdi, %r10      /* r10 <- &v[i] */

       cmpl $0, (%r10)   /* v[i]::0? */
       jge DEPOIS
       movl $0, (%r10)   /* v[i] = 0 */

DEPOIS:
       movslq (%r10), %r11  /*estendo v[i] para 64 bits */
       addq %r11, %rbx      /* s+= long v[i] */
       incl %r12d           /* i++ */
       jmp FOR

FIM:
       movq %rbx, %rax        /* rax (retorno) = s */
       movq -8(%rbp), %rbx    /* restaurando o ebx da função chamadora que estava no RA */
       movq -16(%rbp), %r12   /* restaurando o r12 da função chamadora que estava no RA */
       leave
       ret
