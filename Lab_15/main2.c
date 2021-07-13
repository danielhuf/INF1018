#include <stdio.h>
#include <math.h>

float foo1 (float a, float b);

int main() {
	float a = M_PI_2;
	float b = 3.5;
	printf("%f", foo1(a,b));
	return 0;
}