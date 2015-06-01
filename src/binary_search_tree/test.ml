open Binary_search_tree
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

let () = run_test_tt_main ("binary_search_tree" >::: [

  "size" >:: (fun _ ->
    assert_equal 11 (size x);
  );

])
