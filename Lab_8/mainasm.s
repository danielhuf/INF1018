  .data
  nums: .int 3, -5, 7, 8, -2
  s1:   .string "%d\n"

  .text
  .globl main
  main:
  /* prologo */
     pushq %rbp
     movq  %rsp, %rbp
     subq  $16, %rsp
     movq  %rbx, -8(%rbp)
     movq  %r12, -16(%rbp)

  /* coloque seu codigo aqui */

     movl $0, %ebx   /* ebx=0 */
     movq $nums, %r12  /* r12 = nums */

INICIO_FOR:
     cmpl $5, %ebx
     jge FIM

     movl (%r12), %edi
     movl $1, %esi
     call filtro

/* este trecho imprime o valor de %eax (estraga %eax)  */
     movq  $s1, %rdi    /* primeiro parametro (ponteiro)*/
     movl  %eax, %esi   /* segundo parametro  (inteiro) */
     movl  $0, %eax
     call  printf       /* chama a funcao da biblioteca */

     addq $4, %r12
     addl $1, %ebx

     jmp INICIO_FOR

  /* finalizacao */
FIM:
     movq -8(%rbp), %rbx
     movq -16(%rbp), %r12
     leave
     ret
