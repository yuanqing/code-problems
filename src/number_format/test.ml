open Number_format
open OUnit2

let () = run_test_tt_main ("number_format n" >::: [

  "`n` < 0" >:: (fun _ ->
    assert_equal "-42" (number_format (-42));
    assert_equal "-1,234,567" (number_format (-1234567))
  );

  "`n` = 0" >:: (fun _ ->
    assert_equal "0" (number_format 0)
  );

  "`n` > 0" >:: (fun _ ->
    assert_equal "42" (number_format 42);
    assert_equal "1,234,567" (number_format 1234567)
  );

])
