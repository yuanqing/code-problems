open First_non_repeated_character
open OUnit2

let () = run_test_tt_main ("first_non_repeated_character str" >::: [

  "empty string" >:: (fun _ ->
    assert_raises (Failure "empty string")
        (fun () -> first_non_repeated_character "")
  );

  "single character" >:: (fun _ ->
    assert_equal 'a' (first_non_repeated_character "a")
  );

  "non-repeated character is the first character" >:: (fun _ ->
    assert_equal 'a' (first_non_repeated_character "abbcc")
  );

  "non-repeated character is a middle character" >:: (fun _ ->
    assert_equal 'c' (first_non_repeated_character "aaabbcddee")
  );

  "non-repeated character is the last character" >:: (fun _ ->
    assert_equal 'c' (first_non_repeated_character "aabbc")
  );

])
