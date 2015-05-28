open Reverse_words
open OUnit2

let () = run_test_tt_main ("reverse_words sentence" >::: [

  "no words" >:: (fun _ ->
    assert_equal "" (reverse_words "")
  );

  "a single word" >:: (fun _ ->
    assert_equal "foo" (reverse_words " foo  ");
  );

  "multiple words" >:: (fun _ ->
    assert_equal "baz bar foo" (reverse_words " foo  bar baz ")
  );

])
