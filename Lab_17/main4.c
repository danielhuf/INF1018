#include <stdio.h>

struct X1 {
  int vi;
  float vf;
};

double pack1 (struct X1 *px, int n);

double foo (double a, int b) {
  return a * (-b);
}

int main() {
	struct X1 vetor[4];
	for (int i=0; i<4; i++) {
		vetor[i].vi = 4*i;
		vetor[i].vf = 10*i;
	}
	
	double acc = pack1(vetor, 3);
	printf("Variavel acc = %f\n", acc);

	return 0; 
}

// esperado: -200.0000