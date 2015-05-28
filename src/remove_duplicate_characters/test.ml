open Remove_duplicate_characters
open OUnit2

let () = run_test_tt_main ("remove_duplicate_characters str" >::: [

  "empty string" >:: (fun _ ->
    assert_equal "" (remove_duplicate_characters "")
  );

  "empty string" >:: (fun _ ->
    assert_equal "tre avsl" (remove_duplicate_characters "tree traversal")
  );

])
