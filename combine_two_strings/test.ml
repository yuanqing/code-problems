open Combine_two_strings
open OUnit2

let () = run_test_tt_main ("combine_two_strings x y z" >::: [

  "all empty" >:: (fun _ ->
    assert_equal true  (combine_two_strings "" "" "")
  );

  "non-empty `x`, empty `y`" >:: (fun _ ->
    assert_equal false (combine_two_strings "foo" "" "");
    assert_equal false (combine_two_strings "foo" "" "bar");
    assert_equal true  (combine_two_strings "foo" "" "foo")
  );

  "empty `x`, non-empty `y`" >:: (fun _ ->
    assert_equal false (combine_two_strings "" "foo" "");
    assert_equal false (combine_two_strings "" "foo" "bar");
    assert_equal true  (combine_two_strings "" "foo" "foo")
  );

  "all non-empty; cannot form `z` with `x` and `y`" >:: (fun _ ->
    assert_equal false (combine_two_strings "abc" "cab" "acbbca");
  );

  "all non-empty; can form `z` with `x` and `y`" >:: (fun _ ->
    assert_equal true  (combine_two_strings "abc" "def" "dabecf");
    assert_equal true  (combine_two_strings "abc" "cab" "cabcab");
  );

])
