open Balanced_brackets
open OUnit2

let test = ignore (run_test_tt_main ("balanced_brackets str" >::: [

  "balanced" >:: (fun _ ->
    assert (balanced_brackets "[()]{}")
  );

  "unbalanced" >:: (fun _ ->
    assert (balanced_brackets "[(]{)}" = false)
  );

  "unbalanced, unclosed" >:: (fun _ ->
    assert (balanced_brackets "(" = false)
  );

]))
