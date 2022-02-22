#include <stdio.h>
#include <stdlib.h>

int *create(int size) {
    int *list = (int *)malloc(size * sizeof(int));

    for (int i=0; i<size; i++) {
        list[i] = size - i;
	}

    return list;
}

int main() {
	int size = 10000;
    int *list = create(size);

    if(list == NULL) return 1;

	for (int i=0; i<size; i++) {
        for (int j=0; j<size - i - 1; j++) {
            if (list[j] > list[j + 1]) {
				int tmp = list[j];
				list[j] = list[j + 1];
				list[j + 1] = tmp;
			}
        }
	}

    free(list);

    return 0;
}
