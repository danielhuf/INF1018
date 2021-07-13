#include <stdio.h>
typedef int (*funcp) ();
funcp gera(FILE *f);
void libera(void *pf);