open Money_format
open OUnit2

let () = run_test_tt_main ("money_format n" >::: [

  "`n` < 0" >:: (fun _ ->
    assert_raises (Failure "n < 0") (fun () -> money_format (-1.))
  );

  "`n` = 0" >:: (fun _ ->
    assert_equal "0.00" (money_format 0.)
  );

  "`n` > 0" >:: (fun _ ->
    assert_equal "1 600.00" (money_format 1600.);
    assert_equal "2 310 000.16" (money_format 2310000.159897)
  );

])
