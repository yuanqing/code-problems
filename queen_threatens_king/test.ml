open OUnit2
open Queen_threatens_king

let () = run_test_tt_main ("queen_threatens_king qx qy kx ky" >::: [

  "threatened" >:: (fun _ ->
    assert_equal true  (queen_threatens_king 1 1 3 3);
    assert_equal true  (queen_threatens_king 1 3 3 3);
    assert_equal true  (queen_threatens_king 1 5 3 3);
    assert_equal true  (queen_threatens_king 2 2 3 3);
    assert_equal true  (queen_threatens_king 2 4 3 3);
    assert_equal true  (queen_threatens_king 3 1 3 3);
    assert_equal true  (queen_threatens_king 3 5 3 3);
    assert_equal true  (queen_threatens_king 4 2 3 3);
    assert_equal true  (queen_threatens_king 4 4 3 3);
    assert_equal true  (queen_threatens_king 5 1 3 3);
    assert_equal true  (queen_threatens_king 5 3 3 3);
    assert_equal true  (queen_threatens_king 5 5 3 3)
  );

  "not threatened" >:: (fun _ ->
    assert_equal false (queen_threatens_king 1 2 3 3);
    assert_equal false (queen_threatens_king 1 4 3 3);
    assert_equal false (queen_threatens_king 2 1 3 3);
    assert_equal false (queen_threatens_king 2 5 3 3);
    assert_equal false (queen_threatens_king 4 1 3 3);
    assert_equal false (queen_threatens_king 4 5 3 3);
    assert_equal false (queen_threatens_king 5 2 3 3);
    assert_equal false (queen_threatens_king 5 4 3 3);
  );

])
