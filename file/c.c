#include <stdio.h>
#include <stdlib.h>

// @note: the benchmark case read the whole file in memory to stress memory allocation
// In normal app condition, reading and processing by chunk (of an arbitrary small fixed size suck as 4KB or 8KB)
// is more suited to guarantee no app crash whatever the condition (eg. if the file size exceeds RAM and virtual memory (swap) size)
int main() {	
	FILE *file = fopen("assets/unsplash.jpg", "r");
	
	if(file == NULL) return 1;
	
	fseek(file, 0, SEEK_END);
	long size = ftell(file);
	fseek(file, 0, SEEK_SET);

	char *buffer = (char *)calloc(size, sizeof(char));	
	
	if(buffer == NULL) return 1;
	
	size_t bytesRead = fread(buffer, sizeof(char), size, file);
	fclose(file);
	free(buffer);

	printf("Bytes read: %zu\n", bytesRead);

	return 0;
}