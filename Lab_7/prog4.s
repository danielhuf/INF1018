/*
#include <stdio.h>

int nums[4] = {65, -105, 111, 34};

int main (void) {
  int i;
  int s = 0;

  for (i=0;i<4;i++)
    s = s+nums[i];

  printf ("soma = %d\n", s);

  return 0;
}
*/

.data
nums:  .int  65, -105, 111, 34
Sf:  .string "soma = %d\n"    # string de formato para printf

.text
.globl  main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)
/********************************************************/

  movl  $0, %ebx  /* ebx = 0; */
  movq  $nums, %r12  /* r12 = &nums */
  movl  $0, %ecx  /* ecx = 0; */

L1:
  cmpl  $4, %ebx  /* if (ebx == 4) ? */
  je  L2          /* goto L2 */

  movq  %r12, %r13     /*r13 = r12 */
  movl  $4, %edx       /* edx = 4 */
  imull  %ebx, %edx     /* edx = 4*i  */
  movslq %edx, %rdx    /* estendo edx para 64 bits */
  addq  %rdx, %r13     /* endereço é somado */
  addl  (%r13), %ecx  /* ecx é somado com valor inteiro */
  addl  $1, %ebx  /* ebx += 1; */
  jmp  L1         /* goto L1; */

L2:  
  movl  %ecx, %eax    /* eax = ecx (eax recebe o valor da soma) */

/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/