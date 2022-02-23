CASES := bubble-sort file loop

$(CASES):
	cd $@ \
	&& clang -O3 -o c c.c \
	&& go build go.go \
	&& rustc -C debuginfo=0 -C opt-level=3 rust.rs \
	&& zig build-exe zig.zig -O ReleaseSafe \
	&& hyperfine ./c ./go ./rust ./zig "node js.js" --export-markdown README.md --export-json RESULTS.json --warmup 5

all:
	for case in $(CASES); do \
    	make $$case; \
	done

.PHONY: $(CASES) all
