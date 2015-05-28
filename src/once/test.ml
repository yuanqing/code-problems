open Once
open OUnit2

let identity x = x

let () = run_test_tt_main ("once fn n" >::: [

  "n < 0" >:: (fun _ ->
    assert_raises (Failure "n < 0") (fun () -> once identity (-1))
  );

  "n = 0" >:: (fun _ ->
    let fn = once identity 0 in
    assert_equal None (fn 42);
  );

  "n = 1" >:: (fun _ ->
    let fn = once identity 1 in
    assert_equal (Some 42) (fn 42);
    assert_equal None (fn 42);
  );

  "n = 3" >:: (fun _ ->
    let fn = once identity 3 in
    assert_equal (Some 42) (fn 42);
    assert_equal (Some 42) (fn 42);
    assert_equal (Some 42) (fn 42);
    assert_equal None (fn 42);
  );

])
