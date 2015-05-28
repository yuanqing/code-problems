open Binary_search
open OUnit2

let () = run_test_tt_main ("binary_search compare xs y" >::: [

  "empty" >:: (fun _ ->
    assert_equal (-1) (binary_search compare [] 42);
  );

  "single item; not found" >:: (fun _ ->
    assert_equal (-1) (binary_search compare [23] 42);
  );

  "single item; found" >:: (fun _ ->
    assert_equal 0 (binary_search compare [42] 42);
  );

  "multiple items; found" >:: (fun _ ->
    let xs = [4; 8; 15; 16; 23; 42] in
    assert_equal 0 (binary_search compare xs 4);
    assert_equal 1 (binary_search compare xs 8);
    assert_equal 2 (binary_search compare xs 15);
    assert_equal 3 (binary_search compare xs 16);
    assert_equal 4 (binary_search compare xs 23);
    assert_equal 5 (binary_search compare xs 42);
  );

  "multiple items; not found" >:: (fun _ ->
    let xs = [4; 8; 15; 16; 23; 42] in
    assert_equal (-1) (binary_search compare xs 2);
    assert_equal (-1) (binary_search compare xs 17);
    assert_equal (-1) (binary_search compare xs 99);
  );

])
