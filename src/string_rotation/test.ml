open OUnit2
open String_rotation

let () = run_test_tt_main ("string_rotation x y" >::: [

  "identical; empty" >:: (fun _ ->
    assert_equal true (string_rotation "" "")
  );

  "identical; single character" >:: (fun _ ->
    assert_equal true (string_rotation "a" "a")
  );

  "identical; multiple characters" >:: (fun _ ->
    assert_equal true (string_rotation "abc" "abc")
  );

  "different length" >:: (fun _ ->
    assert_equal false (string_rotation "" "abc")
  );

  "same length; are rotations of each other" >:: (fun _ ->
    assert_equal true (string_rotation "abcd" "bcda")
  );

  "same length; are not rotations of each other" >:: (fun _ ->
    assert_equal false (string_rotation "abcd" "acbd")
  );

])
