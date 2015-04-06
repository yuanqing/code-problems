# File paths.
TEST_FILE := test.ml
EXEC_FILE := test.out
COVERAGE_DIR := coverage/
MODULES_DIR := $(shell ls -d */ | grep -v $(COVERAGE_DIR))

# Use `ocamlopt` to compile to native code.
OO := ocamlfind ocamlopt -g

# Build, run the tests, and generate coverage reports for all modules.
coverage: test
	bisect-report bisect*.out -html $(COVERAGE_DIR)
	@if test -z "$$TRAVIS"; then open -a "Firefox" \
		"$(COVERAGE_DIR)index.html"; fi

# Build and run the tests for all modules.
test: clean-bisect
	$(foreach MODULE_DIR, $(MODULES_DIR), make $(MODULE_DIR)test;)

# Remove all compiled and executable files.
clean: clean-bisect
	rm -rf *.cache *.log *.out */*.annot */*.cm* */*.mli */*.o */*.out

# Remove files generate by the Bisect package.
clean-bisect:
	rm -rf bisect*.out $(COVERAGE_DIR)

# Build, run the test, and generate coverage reports for a single module.
# Eg. `make foo/coverage`.
%/coverage: clean-bisect %/test
	bisect-report `find bisect*.out | tail -1` -html $(COVERAGE_DIR)
	@if test -z "$$TRAVIS"; then open -a "Firefox" \
		"$(COVERAGE_DIR)index.html"; fi

# Build and run the test for a single module. Eg. `make foo/test`.
%/test: %/$(EXEC_FILE)
	@./$*/$(EXEC_FILE)

# Build the executable, with the module .ml and test .ml as dependencies.
%/$(EXEC_FILE): %/*.ml
# Generate the .mli (module interface) from the module .ml.
	$(OO) -i $*/$*.ml > $*/$*.mli
# Compile the .mli to .cmi (compiled module interface).
	$(OO) -c $*/$*.mli
# Compile the module .ml to .cmx (compiled object code).
	$(OO) -c -I $* -package bisect -syntax camlp4o $*/$*.ml
# Compile the test .ml to .cmx.
	$(OO) -c -I $* -package bisect,oUnit -syntax camlp4o $*/$(TEST_FILE)
# Link the module .cmx and test .cmx into the executable.
	$(OO) -I $* -linkpkg -o $*/$(EXEC_FILE) -package bisect,oUnit nums.cmxa \
	  $*/$*.cmx $*/test.cmx

# Every target is PHONY except for %/$(EXEC_FILE).
.PHONY: coverage, test, clean, clean-bisect, %/coverage, %/test

# Prevent removal of each module's compiled executable.
.PRECIOUS: %/$(EXEC_FILE)
