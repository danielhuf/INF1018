#include <stdio.h>

float foo (double a, float b);

int main() {
	double a = 1.5;
	float b = 3.5;
	printf("%f", foo(a,b));
	return 0;
}
