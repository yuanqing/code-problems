open Binary_search_tree
open OUnit2

let non_empty =
  Node (5,
    Node (3,
      Node (2,
        leaf 1,
        Empty
      ),
      leaf 4
    ),
    Node (8,
      Node (6,
        Empty,
        leaf 7
      ),
      leaf 9
    )
  )

let () = run_test_tt_main ("binary_search_tree" >::: [

  "leaf" >:: (fun _ ->
    let x = leaf 42 in
    assert_equal (Node (42, Empty, Empty)) x;
  );

  "create" >:: (fun _ ->
    let x = create compare in
    assert_equal Empty (fst !x);
  );

  "size" >:: (fun _ ->
    let x = ref (non_empty, compare) in
    assert_equal 9 (size x);
    assert_equal 9 (naive_size x);
  );

  "height" >:: (fun _ ->
    let x = create compare in
    assert_equal (-1) (naive_height x);
    assert_equal (-1) (height x);
    let x = ref (non_empty, compare) in
    assert_equal 3 (naive_height x);
    assert_equal 3 (height x);
  );

  "inorder_predecessor" >:: (fun _ ->
    let x = create compare in
    assert_raises (Failure "inorder_predecessor") (fun () -> inorder_predecessor x);
    let x = ref (non_empty, compare) in
    assert_equal 4 (inorder_predecessor x);
  );

  "inorder_successor" >:: (fun _ ->
    let x = create compare in
    assert_raises (Failure "inorder_successor") (fun () -> inorder_successor x);
    let x = ref (non_empty, compare) in
    assert_equal 6 (inorder_successor x);
  );

  "search" >:: (fun _ ->
    let x = create compare in
    assert_equal false (search 42 x);
    let x = ref (non_empty, compare) in
    assert_equal true (search 1 x);
    assert_equal true (search 2 x);
    assert_equal true (search 3 x);
    assert_equal true (search 4 x);
    assert_equal true (search 5 x);
    assert_equal true (search 6 x);
    assert_equal true (search 7 x);
    assert_equal true (search 8 x);
    assert_equal true (search 9 x);
    assert_equal false (search 0 x);
    assert_equal false (search 42 x);
  );

  "insert" >:: (fun _ ->
    let x = create compare in
    assert_equal 2 (insert 2 x);
    assert_equal (leaf 2) (fst !x);
    assert_equal 1 (insert 1 x);
    assert_equal (Node (2, leaf 1, Empty)) (fst !x);
    assert_equal 3 (insert 3 x);
    assert_equal (Node (2, leaf 1, leaf 3)) (fst !x);
  );

  "delete" >:: (fun _ ->
    let x = ref (non_empty, compare) in
    assert_equal 5 (delete 5 x);
    let expected =
      Node (4,
        Node (3,
          Node (2,
            leaf 1,
            Empty
          ),
          Empty
        ),
        Node (8,
          Node (6,
            Empty,
            leaf 7
          ),
          leaf 9
        )
      ) in
    assert_equal expected (fst !x);
  );

])
