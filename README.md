# code-problems [![Build Status](https://img.shields.io/travis/yuanqing/code-problems.svg?branch=master&style=flat)](https://travis-ci.org/yuanqing/code-problems)

> Working through code problems in [OCaml](https://ocaml.org/).

Or, [parlour tricks](https://signalvnoise.com/posts/3071-why-we-dont-hire-programmers-based-on-puzzles-api-quizzes-math-riddles-or-other-parlor-tricks) for the technical interview rigmarole.

## Problems

See the [`src`](src) directory.

Each folder contains the problem description, a solution program, and a test. See [Usage](#usage) for build instructions.

### Data structures

- [Linked list](src/linked_list)
- [Queue](src/queue)
- [Queue using stacks](src/queue_using_stacks)
- [Stack](src/stack)
- [Stack using queues](src/stack_using_queues)
- [Tree traversal](src/tree_traversal)

### Sorting

- [Bubble sort](src/bubble_sort)
- [Insertion sort](src/insertion_sort)
- [Merge sort](src/merge_sort)
- [Quick sort](src/quick_sort)
- [Selection sort](src/selection_sort)

### String

- [Anagram detection](src/anagram_detection)
- [Balanced brackets](src/balanced_brackets)
- [Byte format](src/byte_format)
- [Combine two strings](src/combine_two_strings)
- [CSV parse](src/csv_parse)
- [First non-repeated character](src/first_non_repeated_character)
- [Integer length](src/integer_length)
- [Largest palindrome](src/largest_palindrome)
- [Money format](src/money_format)
- [Number format](src/number_format)
- [Remove duplicate characters](src/remove_duplicate_characters)
- [Reverse words](src/reverse_words)
- [String format](src/string_format)
- [String permutations](src/string_permutations)
- [String rotation](src/string_rotation)

### Math

- [Factorial](src/factorial)
- [Fibonacci](src/fibonacci)
- [Prime number](src/prime_number)

### Array

- [Array pair sum](src/array_pair_sum)
- [Binary search](src/binary_search)
- [Even-occurring element](src/even_occurring_element)
- [Integer difference](src/integer_difference)
- [Largest continuous sum](src/largest_continuous_sum)
- [Longest common prefix](src/longest_common_prefix)
- [Longest words](src/longest_words)
- [Missing element](src/missing_element)
- [Odd-occurring element](src/odd_occurring_element)
- [Sum of list plus one](src/sum_of_list_plus_one)
- [Sum of multiples](src/sum_of_multiples)

### Other

- [Once](src/once)
- [Queen threatens king](src/queen_threatens_king)

## Notes

- Memoise/cache all the things! (Or at least when it is possible to do so, anyway.) The [`Hashtbl`](http://caml.inria.fr/pub/docs/manual-ocaml/libref/Hashtbl.html) module is your friend.
- If we&rsquo;re writing a recursive function (which is most of the time), be sure to write it such that it is [tail recursive](https://ocaml.org/learn/tutorials/if_statements_loops_and_recursion.html#Tailrecursion).
- Short-circuit execution by throwing an exception.
- Avoid `ref` if possible.
- Variable naming conventions:
  - Lists &mdash; `xs`, `ys`&hellip;
  - Item in a list &mdash; `x`, `y`&hellip;
  - Auxiliary recursive functions &mdash; `aux`
- Annotate top-level functions.

## Usage

### Pre-requisites

- [OCaml](https://ocaml.org/) 4.02
- [OPAM](https://opam.ocaml.org) 1.2.0

### Set up

First, install [ocamlfind](https://opam.ocaml.org/packages/ocamlfind/ocamlfind.1.5.5/), [oUnit](https://opam.ocaml.org/packages/ounit/ounit.2.0.0/), and [Bisect](https://opam.ocaml.org/packages/bisect/bisect.1.3/) with OPAM:

```
$ opam install ocamlfind ounit bisect
```

Then, grab this repository:

```
$ git clone https://github.com/yuanqing/code-problems
```

### Run all the tests

```
$ cd code-problems/src
$ make
```

Use `make coverage` to also generate test coverage reports.

### Run a particular test

&hellip;for example, for the [binary search](src/binary_search) problem:

```
$ make binary_search/test
```

Use `make binary_search/coverage` to also generate test coverage reports.

## Known issues

- The [Bisect](http://bisect.x9c.fr) test coverage does not appear to be completely accurate.

## Credit

The main bulk of the problems are from the [**code-problems**](https://github.com/blakeembrey/code-problems) project maintained by [Blake Embrey](https://github.com/blakeembrey).

All solution programs in this repository were written by [me](https://github.com/yuanqing).

## License

[MIT](LICENSE)
