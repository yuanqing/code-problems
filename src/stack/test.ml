open Stack
open OUnit2

let () = run_test_tt_main ("stack" >::: [

  "push, pop" >:: (fun _ ->
    let s : int t = create () in
    assert_raises (Failure "pop") (fun () -> pop s);
    push 1 s; (* [1] *)
    push 2 s; (* [2; 1] *)
    assert_equal 2 (pop s); (* [1] *)
    push 3 s; (* [3; 1] *)
    assert_equal 3 (pop s); (* [1] *)
    assert_equal 1 (pop s); (* [] *)
    assert_raises (Failure "pop") (fun () -> pop s)
  );

])
