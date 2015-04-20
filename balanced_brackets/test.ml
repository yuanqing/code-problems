open Balanced_brackets
open OUnit2

let () = run_test_tt_main ("balanced_brackets str" >::: [

  "balanced" >:: (fun _ ->
    assert_equal true  (balanced_brackets "[()]{}")
  );

  "unbalanced" >:: (fun _ ->
    assert_equal false (balanced_brackets "[(]{)}")
  );

  "unbalanced, unclosed" >:: (fun _ ->
    assert_equal false (balanced_brackets "(")
  );

])
