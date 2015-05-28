open Largest_continuous_sum
open OUnit2

let () = run_test_tt_main ("largest_continuous_sum xs" >::: [

  "empty list" >:: (fun _ ->
    assert_equal 0 (largest_continuous_sum []);
  );

  "non-empty list, all positive" >:: (fun _ ->
    assert_equal 42 (largest_continuous_sum [32; 1; 7; 2]);
  );

  "non-empty list, all negative" >:: (fun _ ->
    assert_equal (-1) (largest_continuous_sum [-1; -7; -32; -2]);
  );

  "non-empty list, with positive and negative" >:: (fun _ ->
    assert_equal 32 (largest_continuous_sum [1; -7; 32; -2]);
  );

])
