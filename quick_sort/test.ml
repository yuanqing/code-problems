open Quick_sort
open OUnit2

let () = run_test_tt_main ("quick_sort comp xs" >::: [

  "empty list" >:: (fun _ ->
    assert_equal [] (quick_sort compare [])
  );

  "single item" >:: (fun _ ->
    assert_equal [42] (quick_sort compare [42])
  );

  "multiple items; ascending order" >:: (fun _ ->
    assert_equal [4; 8; 15; 16; 23; 42]
        (quick_sort compare [42; 8; 15; 23; 4; 16])
  );

  "multiple items; descending order" >:: (fun _ ->
    assert_equal [42; 23; 16; 15; 8; 4]
        (quick_sort (fun x y -> -(compare x y)) [42; 8; 15; 23; 4; 16])
  );

])
