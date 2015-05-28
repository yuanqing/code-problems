open Sum_of_multiples
open OUnit2

let () = run_test_tt_main ("sum_of_multiples xs n" >::: [

  "no multiples" >:: (fun _ ->
    assert_raises (Failure "no multiples") (fun () -> sum_of_multiples [] 10)
  );

  "`n` < 0" >:: (fun _ ->
    assert_raises (Failure "n < 0") (fun () -> sum_of_multiples [2] (-1))
  );

  "valid" >:: (fun _ ->
    assert_equal 23 (sum_of_multiples [3; 5] 10);
    assert_equal 233168 (sum_of_multiples [3; 5] 1000)
  );

])
