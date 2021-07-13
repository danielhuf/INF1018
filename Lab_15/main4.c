#include <stdio.h>
#include <math.h>

double foo3 (double *a, int n); 

int main() {
	double a[] = {M_PI_2, M_PI, 0, 0, M_PI_2};
	printf("%f\n", foo3(a,5));
	return 0;
}