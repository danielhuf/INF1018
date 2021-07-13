#include <stdio.h>

struct X {
  int vi;
  double vd;
  struct X *next;
};

double pack (struct X *px);

double foo (double a, int b) {
  return a * (-b);
}

int main() {
	struct X vetor[4];
	for (int i=0; i<3; i++) {
		vetor[i].next = &vetor[i+1];
		vetor[i].vi = 4*i;
		vetor[i].vd = 10*i;
	}
	vetor[3].vi = 12;
	vetor[3].vd = 30;
	vetor[3].next = NULL;
	
	double acc = pack(vetor);
	printf("Variavel acc = %f\n", acc);

	return 0; 
}