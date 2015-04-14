open Insertion_sort
open OUnit2

let asc x y =
  if x < y then -1
  else if x > y then 1
  else 0

let dsc x y =
  if x < y then 1
  else if x > y then -1
  else 0

let () = run_test_tt_main ("insertion_sort comp xs" >::: [

  "empty list" >:: (fun _ ->
    assert_equal [] (insertion_sort asc [])
  );

  "single item" >:: (fun _ ->
    assert_equal [42] (insertion_sort asc [42])
  );

  "multiple items; ascending order" >:: (fun _ ->
    assert_equal [4; 8; 15; 16; 23; 42]
        (insertion_sort asc [42; 8; 15; 23; 4; 16])
  );

  "multiple items; descending order" >:: (fun _ ->
    assert_equal [42; 23; 16; 15; 8; 4]
        (insertion_sort dsc [42; 8; 15; 23; 4; 16])
  );

])
