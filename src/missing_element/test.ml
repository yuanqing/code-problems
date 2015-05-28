open Missing_element
open OUnit2

let () = run_test_tt_main ("missing_element xs ys" >::: [

  "`xs` and `ys` are identical" >:: (fun _ ->
    assert_raises (Failure "invalid input")
        (fun () -> missing_element [42] [42])
  );

  "`ys` has more elements" >:: (fun _ ->
    assert_raises (Failure "invalid input")
        (fun () -> missing_element [42] [42; 42])
  );

  "`ys` is missing one element as compared to `xs`" >:: (fun _ ->
    assert_equal 42 (missing_element [16; 42; 23; 42] [16; 42; 23])
  );

])
