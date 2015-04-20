open Integer_length
open OUnit2

let () = run_test_tt_main ("integer_length n" >::: [

  "single digit" >:: (fun _ ->
    assert_equal 1 (integer_length 7)
  );

  "multiple digits" >:: (fun _ ->
    assert_equal 19 (integer_length 1234567891234567890)
  );

])
