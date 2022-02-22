function create(size) {
	const output = [];
	let i;

	for (i = 0; i < size; i++) {
		output[i] = size - i;
	}

	return output;
};

function main() {
	const list = create(10000);
	const len = list.length;
	let i, j;

	for (i = 0; i < len; i++) {
		for (j = 0; j < len - i - 1; j++) {
			if (list[j] > list[j + 1]) {
				const tmp = list[j];
				list[j] = list[j + 1];
				list[j + 1] = tmp;
			}
		}
	}
};

main();
