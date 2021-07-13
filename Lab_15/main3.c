#include <stdio.h>
#include <math.h>

double foo2 (float a, float b);

int main() {
	float a = 0;
	float b = M_PI;
	printf("%f\n", foo2(a,b));
	return 0;
}