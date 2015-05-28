open OUnit2
open Sum_of_list_plus_one

let () = run_test_tt_main ("sum_of_list_plus_one xx" >::: [

  "empty list" >:: (fun _ ->
    assert_equal 0 (sum_of_list_plus_one [])
  );

  "non-empty list" >:: (fun _ ->
    assert_equal 14 (sum_of_list_plus_one [1; 2; 3; 4])
  );

])
