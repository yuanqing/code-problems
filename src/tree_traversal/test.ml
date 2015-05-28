open Tree_traversal
open OUnit2

let x =
  Node (0,
    Node (1,
      Node (3,
        Empty,
        Empty
      ),
      Node (4,
        Empty,
        Node (7,
          Empty,
          Empty
        )
      )
    ),
    Node (2,
      Node (5,
        Node (8,
          Empty,
          Empty
        ),
        Empty
      ),
      Node (6,
        Node (9,
          Empty,
          Empty
        ),
        Node (10,
          Empty,
          Empty
        )
      )
    )
  )

let () = run_test_tt_main ("tree" >::: [

  "pre-order" >:: (fun _ ->
    let xs = [ 0; 1; 3; 4; 7; 2; 5; 8; 6; 9; 10 ] in
    assert_equal xs (naive_pre_order x);
    assert_equal xs (pre_order x)
  );

  "post-order" >:: (fun _ ->
    let xs = [ 3; 7; 4; 1; 8; 5; 9; 10; 6; 2; 0 ] in
    assert_equal xs (naive_post_order x);
    assert_equal xs (post_order x)
  );

  "in-order" >:: (fun _ ->
    let xs = [ 3; 1; 4; 7; 0; 8; 5; 2; 9; 6; 10 ] in
    assert_equal xs (naive_in_order x);
    assert_equal xs (in_order x)
  );

  "level-order" >:: (fun _ ->
    let xs = [ 0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ] in
    assert_equal xs (level_order x)
  );

  "level-order, list" >:: (fun _ ->
    let xs = [
      [ 0 ];
      [ 1; 2 ];
      [ 3; 4; 5; 6 ];
      [ 7; 8; 9; 10 ];
    ] in
    assert_equal xs (level_order_list x)
  );

])
