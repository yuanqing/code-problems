open Selection_sort
open OUnit2

let () = run_test_tt_main ("selection_sort compare xs" >::: [

  "empty list" >:: (fun _ ->
    assert_equal [] (selection_sort compare [])
  );

  "single item" >:: (fun _ ->
    assert_equal [42] (selection_sort compare [42])
  );

  "multiple items; ascending order" >:: (fun _ ->
    assert_equal [4; 8; 15; 16; 23; 42]
        (selection_sort compare [42; 8; 15; 23; 4; 16])
  );

  "multiple items; descending order" >:: (fun _ ->
    assert_equal [42; 23; 16; 15; 8; 4]
        (selection_sort (fun x y -> -(compare x y)) [42; 8; 15; 23; 4; 16])
  );

])
