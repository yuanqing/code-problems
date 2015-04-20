open Largest_palindrome
open OUnit2

let () = run_test_tt_main ("largest_palindrome str" >::: [

  "empty string" >:: (fun _ ->
    assert_equal "" (largest_palindrome "")
  );

  "single character" >:: (fun _ ->
    assert_equal "x" (largest_palindrome "x")
  );

  "multiple characters" >:: (fun _ ->
    assert_equal "d racecar d" (largest_palindrome "I am a red racecar driver")
  );

])
