# code-problems [![Build Status](https://img.shields.io/travis/yuanqing/code-problems.svg?branch=master&style=flat)](https://travis-ci.org/yuanqing/code-problems)

> Working through code problems in [OCaml](https://ocaml.org/).

Or, [parlour tricks](https://signalvnoise.com/posts/3071-why-we-dont-hire-programmers-based-on-puzzles-api-quizzes-math-riddles-or-other-parlor-tricks) for the technical interview rigmarole.

- [Problems](#problems)
  - [Data structures and algorithms](#i-data-structures-and-algorithms)
  - [Puzzles](#ii-puzzles)
- [Style guide](#style-guide)
- [Usage](#usage)
- [Known issues](#known-issues)
- [Credit](#credit)
- [License](#license)

## Problems

All the problems are in [`src/`](src), and loosely organised into categories below.

Each problem comprises a brief description, a solution program, and a test. (See [Usage](#usage) for instructions on how to build and run the tests.)

### I. Data structures and algorithms

#### Array/list

- [Binary search](src/binary_search)
- [Linked list](src/linked_list)

#### Math

- [Factorial](src/factorial)
- [Fibonacci](src/fibonacci)
- [Prime number](src/prime_number)

#### Queue

- [Queue](src/queue)
- [Queue using stacks](src/queue_using_stacks)

#### Sorting

- [Bubble sort](src/bubble_sort)
- [Insertion sort](src/insertion_sort)
- [Merge sort](src/merge_sort)
- [Quick sort](src/quick_sort)
- [Selection sort](src/selection_sort)

#### Stack

- [Stack](src/stack)
- [Stack using queues](src/stack_using_queues)

#### Tree

- [Binary search tree](src/binary_search_tree)
- [Tree traversal](src/tree_traversal)

### II. Puzzles

#### Array/list

- [Array pair sum](src/array_pair_sum)
- [Even-occurring element](src/even_occurring_element)
- [Integer difference](src/integer_difference)
- [Largest continuous sum](src/largest_continuous_sum)
- [Longest common prefix](src/longest_common_prefix)
- [Longest words](src/longest_words)
- [Missing element](src/missing_element)
- [Odd-occurring element](src/odd_occurring_element)
- [Sum of list plus one](src/sum_of_list_plus_one)
- [Sum of multiples](src/sum_of_multiples)

#### String

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

#### Other

- [Once](src/once)
- [Queen threatens king](src/queen_threatens_king)

## Style guide

### General practices

- Only use the [OCaml standard library](http://caml.inria.fr/pub/docs/manual-ocaml/libref/index.html).
- Memoise/cache all the things! (Or at least when we [absolutely must do so](src/fibonacci/fibonacci.ml#L2-L6), anyway.) The [`Hashtbl`](http://caml.inria.fr/pub/docs/manual-ocaml/libref/Hashtbl.html) module is your friend.
- Top-level functions should not be recursive. Instead, [use an auxiliary recursive function](src/binary_search/binary_search.ml#L2) inside the top-level function.
- If we&rsquo;re writing a recursive function (which is probably most of the time), try as far as possible to write it such that it is [tail recursive](src/tree_traversal/tree_traversal.ml#L5-L27).
- For readability, annotate the arguments and return type of all top-level functions.
- Short-circuit execution by [throwing an exception](src/balanced_brackets/balanced_brackets.ml#L25-L36).
- Avoid [mutable variables](https://ocaml.org/learn/tutorials/pointers.html) if possible.

### Naming conventions

Use short variable names if we are dealing with very few variables, or if the meaning is obvious (or can be intuitively inferred). Some general conventions:

- Auxiliary function &mdash; `aux`
- List &mdash; `xs` (or `ys`, `zs`)
- Items in a list &mdash; `x` (or `y`, `z`)
- List for accumulating values &mdash; `acc`
- Binary tree &mdash; value `v` (or `w`) with a `l` subtree and a `r` subtree
- String &mdash; `str`
- Integer &mdash; `n` (or `m`)
- Length of a string or list &mdash; `len`

If there is ambiguity (eg. when we are dealing with many variables of the same type), use more descriptive names in `snake_case`.

## Usage

### Pre-requisites

- [OCaml](https://ocaml.org/) 4.02
- [OPAM](https://opam.ocaml.org) 1.2.0

### Set up

First, install [ocamlfind](https://opam.ocaml.org/packages/ocamlfind/ocamlfind.1.5.5/), [oUnit](https://opam.ocaml.org/packages/ounit/ounit.2.0.0/) (for tests), and [Bisect](https://opam.ocaml.org/packages/bisect/bisect.1.3/) (for test coverage) with OPAM:

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

Use `make coverage` to run the tests and generate coverage reports (output to `coverage/`).

### Run a particular test

&hellip;for example, for the [binary search](src/binary_search) problem:

```
$ make binary_search/test
```

Use `make binary_search/coverage` to run the test and generate coverage reports (output to `coverage/`).

### Clean

To remove all compiled files and other debris:

```
$ make clean
```

## Known issues

- The [Bisect](http://bisect.x9c.fr) test coverage does not appear to be completely accurate.

## Credit

The bulk of the problems are from the [**code-problems**](https://github.com/blakeembrey/code-problems) project maintained by [Blake Embrey](https://github.com/blakeembrey).

All solution programs in this repository were written by [me](https://github.com/yuanqing).

## License

[MIT](LICENSE)
