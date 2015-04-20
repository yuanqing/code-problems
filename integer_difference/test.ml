open Integer_difference
open OUnit2

let () = run_test_tt_main ("integer_difference n xs" >::: [

  "empty `xs`" >:: (fun _ ->
    assert_equal 0 (integer_difference 0 [])
  );

  "non-empty `xs`" >:: (fun _ ->
    assert_equal 4 (integer_difference 2 [1; 1; 3; 3]);
    assert_equal 3 (integer_difference 4 [1; 1; 5; 6; 9; 16; 27])
  );

])
