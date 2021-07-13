#include <stdio.h>  

typedef int (*funcp) (int x);     // ponteiro para a função

int add (int x) {
  return x+1;
}

int main(void) {
	unsigned char codigo[] = {
   	0x55,                          // push   %rbp
   	0x48, 0x89, 0xe5,              // mov    %rsp,%rbp
   	0xe9, 0x00, 0x00, 0x00, 0x00,  // jmpq 9 <foo3+0x9>
   	0xc9,                          // leaveq
   	0xc3                           // retq
	};
	funcp f;   // f é ponteiro para função
	int i, pos, desloc;

	unsigned int x = (unsigned *)add - (unsigned *)(codigo+9);
	for (i=0, pos=5, desloc=0; i<4; i++, pos++, desloc+=8)
		codigo[pos] = x>>desloc;

	f = (funcp)codigo; 
	i = (*f)(10);
        printf("O valor de i é %d\n", i);
	
	return 0;
}