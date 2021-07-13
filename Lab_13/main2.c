#include <stdio.h>  

typedef int (*funcp) (int x);     // ponteiro para a função

int add (int x) {
  return x+1;
}

int main(void) {

	funcp f;   // f é ponteiro para função
	int i, pos, desloc;
	static unsigned char codigo[] = {
   		0x55,                          // push   %rbp
   		0x48, 0x89, 0xe5,              // mov    %rsp,%rbp
   		0xe8, 0x00, 0x00, 0x00, 0x00,  // callq 9 <foo2+0x9>
   		0xc9,                          // leaveq
   		0xc3                           // retq
	};

	unsigned int x = (unsigned *)add - (unsigned *)(codigo+9);
	printf("%p %p %08X \n", add, codigo, x);
	for (i=0, pos=5, desloc=0; i<4; i++, pos++, desloc+=8) {
		codigo[pos] = x>>desloc;
		printf("%02X\n", codigo[pos]);
	}
	for (i=0; i<11; i++)
		printf("%02X ", codigo[i]);
	printf("aqui 3\n");

	f = (funcp)codigo; 
	i = (*f)(10);
        printf("O valor de i é %d\n", i);
	
	return 0;
}