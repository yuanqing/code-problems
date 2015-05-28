open Big_int
open Factorial
open OUnit2

let () = run_test_tt_main ("factorial n" >::: [

  "n < 0" >:: (fun _ ->
    assert_raises (Failure "n < 0") (fun () -> factorial (-1))
  );

  "n = 0" >:: (fun _ ->
    assert (eq_big_int (big_int_of_int 1) (factorial 0))
  );

  "n = 1" >:: (fun _ ->
    assert (eq_big_int (big_int_of_int 1) (factorial 1))
  );

  "n = 2" >:: (fun _ ->
    assert (eq_big_int (big_int_of_int 2) (factorial 2))
  );

  "n = 3" >:: (fun _ ->
    assert (eq_big_int (big_int_of_int 6) (factorial 3))
  );

  "n = 10" >:: (fun _ ->
    assert (eq_big_int (big_int_of_int 3628800) (factorial 10))
  );

])
