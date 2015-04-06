open Big_int
open Fibonacci
open OUnit2

let test_foo = ignore (run_test_tt_main ("fib n" >::: [

  "n < 1" >:: (fun _ ->
    assert_raises (Failure "n < 1") (fun () -> fib 0)
  );

  "n = 1" >:: (fun _ ->
    assert (eq_big_int (big_int_of_int 0) (fib 1))
  );

  "n = 2" >:: (fun _ ->
    assert (eq_big_int (big_int_of_int 1) (fib 2))
  );

  "n = 3" >:: (fun _ ->
    assert (eq_big_int (big_int_of_int 1) (fib 3))
  );

  "n = 10" >:: (fun _ ->
    assert (eq_big_int (big_int_of_int 34) (fib 10))
  );

  "n = 99" >:: (fun _ ->
    assert (eq_big_int (Big_int.big_int_of_string "135301852344706746049")
        (fib 99))
  );

]))
