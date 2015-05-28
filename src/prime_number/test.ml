open OUnit2
open Prime_number

let () = run_test_tt_main ("prime_number n" >::: [

  "n < 2" >:: (fun _ ->
    assert_equal false (prime_number (-1));
    assert_equal false (prime_number 0);
    assert_equal false (prime_number 1)
  );

  "n >= 2, is a prime" >:: (fun _ ->
    assert_equal true  (prime_number 2);
    assert_equal true  (prime_number 3);
    assert_equal true  (prime_number 5);
    assert_equal true  (prime_number 7919)
  );

  "n >= 2, not a prime" >:: (fun _ ->
    assert_equal false (prime_number 4);
    assert_equal false (prime_number 6);
    assert_equal false (prime_number 8);
    assert_equal false (prime_number 7920)
  );

])
