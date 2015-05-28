open Even_occurring_element
open OUnit2

let () = run_test_tt_main ("even_occurring_element xs" >::: [

  "list contains just the even-occurring element" >:: (fun _ ->
    assert_equal 42 (even_occurring_element [42; 42]);
  );

  "list also contains other elements" >:: (fun _ ->
    assert_equal 42 (even_occurring_element [1; 42; 2; 2; 2; 3; 42]);
  );

])
