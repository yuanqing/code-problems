# code-problems [![Build Status](https://img.shields.io/travis/yuanqing/code-problems.svg?branch=master&style=flat)](https://travis-ci.org/yuanqing/code-problems)

> Working through assorted code problems in [OCaml](https://ocaml.org/).

Problems are in [`src`](https://github.com/yuanqing/code-problems/tree/master/src). Each folder contains a problem statement, a solution program and a unit test.

## Usage

### Set up

First, install [ocamlfind](https://opam.ocaml.org/packages/ocamlfind/ocamlfind.1.5.5/), [oUnit](http://opam.ocaml.org/packages/ounit/ounit.2.0.0/), and [Bisect](http://opam.ocaml.org/packages/bisect/bisect.1.3/) with [OPAM](https://opam.ocaml.org):

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

For example, for the [`binary_search`](https://github.com/yuanqing/code-problems/tree/master/src/binary_search) problem:

```
$ make binary_search/test
```

Use `make binary_search/coverage` instead to also generate test coverage reports.

## Credit

The main bulk of the problems are from the [**code-problems**](https://github.com/blakeembrey/code-problems) project maintained by [Blake Embrey](https://github.com/blakeembrey).

All solution programs in this repository were written by [me](https://github.com/yuanqing).

## License

[MIT](https://github.com/yuanqing/code-problems/blob/master/LICENSE)
