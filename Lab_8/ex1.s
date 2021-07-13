  .data
  s1: .string "ls -ls"

  .text
  .globl main
  main:
  /* prologo */
    pushq %rbp
    movq  %rsp, %rbp

  /* coloque seu codigo aqui */
  movq $s1, %rdi  /* primeiro parâmetro (ponteiro) */
  call system

  /* finalizacao */
    leave
    ret
