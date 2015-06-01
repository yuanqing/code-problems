open Linked_list
open OUnit2

let () = run_test_tt_main ("linked list" >::: [

  "create" >:: (fun _ ->

    assert_equal (ref None) (create ());

  );

  "from_list" >:: (fun _ ->

    assert_equal (ref None) (from_list []);
    assert_equal (ref (Some (1, None))) (from_list [1]);
    assert_equal (ref (Some (1, Some (2, None)))) (from_list [1; 2]);

  );

  "to_list" >:: (fun _ ->

    assert_equal [] (to_list (ref None));
    assert_equal [1] (to_list (ref (Some (1, None))));
    assert_equal [1; 2] (to_list (ref (Some (1, Some (2, None)))));

  );

  "nth" >:: (fun _ ->

    let xs = from_list [1; 2; 3] in
    assert_raises (Failure "nth") (fun () -> nth (-1) xs);
    assert_equal 1 (nth 0 xs);
    assert_equal 2 (nth 1 xs);
    assert_equal 3 (nth 2 xs);
    assert_raises (Failure "nth") (fun () -> nth 3 xs);

   );

  "add_first" >:: (fun _ ->

    let xs = create () in
    assert_equal 1 (add_first 1 xs);
    assert_equal [1] (to_list xs);
    assert_equal 2 (add_first 2 xs);
    assert_equal [2; 1] (to_list xs);
    assert_equal 3 (add_first 3 xs);
    assert_equal [3; 2; 1] (to_list xs);

  );

  "add_last" >:: (fun _ ->

    let xs = create () in
    assert_equal 1 (add_last 1 xs);
    assert_equal [1] (to_list xs);
    assert_equal 2 (add_last 2 xs);
    assert_equal [1; 2] (to_list xs);
    assert_equal 3 (add_last 3 xs);
    assert_equal [1; 2; 3] (to_list xs);

  );

  "remove_first" >:: (fun _ ->

    let xs = from_list [1; 2; 3] in
    assert_equal 1 (remove_first xs);
    assert_equal [2; 3] (to_list xs);
    assert_equal 2 (remove_first xs);
    assert_equal [3] (to_list xs);
    assert_equal 3 (remove_first xs);
    assert_equal [] (to_list xs);
    assert_raises (Failure "remove_first") (fun () -> remove_first xs);

  );

  "remove_last" >:: (fun _ ->

    let xs = from_list [1; 2; 3] in
    assert_equal 3 (remove_last xs);
    assert_equal [1; 2] (to_list xs);
    assert_equal 2 (remove_last xs);
    assert_equal [1] (to_list xs);
    assert_equal 1 (remove_last xs);
    assert_equal [] (to_list xs);
    assert_raises (Failure "remove_last") (fun () -> remove_last xs);

   );

  "insert" >:: (fun _ ->

    let xs = from_list [1; 2; 3] in
    assert_raises (Failure "insert") (fun () -> insert 42 (-1) xs);

    let xs = from_list [1; 2; 3] in
    assert_equal 42 (insert 42 0 xs);
    assert_equal [42; 1; 2; 3] (to_list xs);

    let xs = from_list [1; 2; 3] in
    assert_equal 42 (insert 42 1 xs);
    assert_equal [1; 42; 2; 3] (to_list xs);

    let xs = from_list [1; 2; 3] in
    assert_equal 42 (insert 42 2 xs);
    assert_equal [1; 2; 42; 3] (to_list xs);

    let xs = from_list [1; 2; 3] in
    assert_equal 42 (insert 42 3 xs);
    assert_equal [1; 2; 3; 42] (to_list xs);

   );

  "reverse" >:: (fun _ ->

    let xs = from_list [] in
    assert_equal () (reverse xs);
    assert_equal [] (to_list xs);

    let xs = from_list [1] in
    assert_equal () (reverse xs);
    assert_equal [1] (to_list xs);

    let xs = from_list [1; 2; 3] in
    assert_equal () (reverse xs);
    assert_equal [3; 2; 1] (to_list xs);

  );

])
