#include <stdio.h>  

unsigned char codigo[] = {
   0x55,                        // push   %rbp
   0x48, 0x89, 0xe5,            // mov    %rsp,%rbp
   0xff, 0xc7,                  // inc    %edi
   0x89, 0xf8,                  // mov    %edi,%eax
   0xc9,                        // leaveq
   0xc3                         // retq
};

typedef int (*funcp) (int x);     // ponteiro para a função

int main(void) {
	funcp f;   // f é ponteiro para função
	int i;

        //f = putchar;
        //f('x');
	f = (funcp)codigo;  // isso NÃO chama a função
	i = (*f)(10);
        printf("O valor de i é %d\n", i);
	
	return 0;
}