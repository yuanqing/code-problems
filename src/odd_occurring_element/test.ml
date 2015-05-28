open Odd_occurring_element
open OUnit2

let () = run_test_tt_main ("odd_occurring_element xs" >::: [

  "list contains just the even-occurring element" >:: (fun _ ->
    assert_equal 42 (odd_occurring_element [42; 42; 42]);
  );

  "list also contains other elements" >:: (fun _ ->
    assert_equal 42 (odd_occurring_element [1; 1; 2; 42; 2; 2; 2; 42; 42]);
  );

])
