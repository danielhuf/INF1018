/*
struct Sim
{
   int cc;
   char s;
   short tp;
   struct Sim *prox;
};

int boo(int n, struct Sim *p)
{
   int t;
   if (p == NULL)
   return 1;
	
   t = boo(n-1, p->prox);
   p->cc = t;
   p->tp = n;
   if (n%2)
      p->s = 'a';
   else
      p->s = 'b';
   return t+2;
}
*/

/*
DICIONÁRIO

Reg   Variavel  Descricao
RIP                proxima instrucao
RSP                ponteiro para topo da pilha
RBP                ponteiro para base do RA
edi     n
rsi     struct Sim *p
eax     valor retorno (inteiro)
r12d     t

campos da struct:
cc cc cc cc s x tp tp prox prox prox prox prox prox prox prox

*/

.text
.globl boo
boo:
    	/* Registro de Ativação */
	pushq %rbp         /* salva na pilha o BP da função chamadora e coloca a pilha novamente múltiplo de 16*/
	movq %rsp, %rbp    /* Criando a base do meu RA */
        subq $16, %rsp     /* abridno espaço no RA */
        movq %r12, -8(%rbp)   /* salvando r12 da função chamadora no ra */

INICIO:
	cmpq $0, %rsi       /* p::0? (NULL é lido como 0) */
        jne DEPOIS
        movl $1, %eax      /* eax=1, que será retornado*/
        jmp FIM 

DEPOIS:
       movl %edi, -4(%rbp)     /* salvando os 2 argumentos da função chamadora */
       movq %rsi, -12(%rbp)

       decl %edi           /*n-- */
       movq 8(%rsi), %rsi  /*segundo argumento vira p->prox*/
       call boo

       movl -4(%rbp), %edi    /* restaurando os argumentos da função chamadora */
       movq -12(%rbp), %rsi

       movl %eax, %r12d      /* t = retorno de boo */
       movl %r12d, (%rsi)    /* p->cc = t */
       movl %edi, 6(%rsi)   /* p->tp  = n */

       movl %edi, -4(%rbp)    /* salvando edi */
       andl $0x01, %edi      /* testando pra ver se n é par ou impar */
       je ELSE               /* se terminar em 0, é par, vai pra ELSE */

       movb $97, 4(%rsi)    /*p->s = 'a'(97 em ascii) */
       jmp DEPOIS2

ELSE:
       movb $98, 4(%rsi)   /*p->s = 'b' (98 em ascii) */

DEPOIS2:
       movl -4(%rbp), %edi    /*restaurando edi */
       addl $2, %r12d        /* t+=2 */
       movl %r12d, %eax      /* eax (valor retorno) = t+2 */

FIM:
       movq -8(%rbp), %r12   /* restaurando o r12 da função chamadora */
       leave
       ret
