// For Rust: rustc -C debuginfo=0 -C opt-level=3 rust.rs // with optimization flag (same as cargo build --release)
// For Go: go build go.go
// For C: gcc -O3 -Wall -o c c.c
// For Zig: zig build-exe zig.zig -O ReleaseSafe
// hyperfine ./c ./go ./rust ./zig "node js.js"  --warmup 5
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
