#include <stdio.h>

int main() {
	int size = 100000;
	int value = 0;

	for (int i=0; i<size; i++) {
		value = i;
	}

	printf("%d\n", value);

	return 0;
}