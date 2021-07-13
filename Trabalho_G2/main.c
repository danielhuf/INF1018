#include <stdlib.h>
#include "gera.h"

int main() {
   
    funcp funcaoSimples;
    
    FILE *f = fopen("simples.txt","r");
    if (f == NULL) {
      	printf("Erro na abertura do arquivo\n");
      	exit(1);
    }
    
    /* traduz a função Simples */
    funcaoSimples = gera(f);
    fclose(f);
    printf("retorno -> %d\n", funcaoSimples(-50));
    libera(funcaoSimples);
    return 0;
}