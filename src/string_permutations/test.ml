open OUnit2
open String_permutations

let () = run_test_tt_main ("permute str" >::: [

  "empty string" >:: (fun _ ->
    assert_equal [] (permute "")
  );

  "non-empty string" >:: (fun _ ->
    assert_equal ["acb"; "cab"; "cba"; "abc"; "bac"; "bca"] (permute "abc")
  );

])
