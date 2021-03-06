LIBNAME := $(shell rustc --print-file-name src/lib.rs)


all: argparse-lib

test: argparse_test
	./argparse_test

argparse_test: src/lib.rs src/*.rs
	rustc -o $@ --test $<

argparse-lib: $(LIBNAME)

$(LIBNAME): src/lib.rs src/*.rs
	rustc -o $@ $<

examples: greeting structure

%: examples/%.rs $(LIBNAME)
	rustc -o $@ $< -L .

.PHONY: argparse-lib test examples
