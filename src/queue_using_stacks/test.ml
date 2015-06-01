open Queue_using_stacks
open OUnit2

let () = run_test_tt_main ("queue_using_stacks" >::: [

  "enqueue, poll" >:: (fun _ ->
    let q : int t = create () in
    assert_raises (Failure "poll") (fun () -> poll q);
    enqueue 1 q; (* [1] *)
    enqueue 2 q; (* [1; 2] *)
    assert_equal 1 (poll q); (* [2] *)
    enqueue 3 q; (* [2; 3] *)
    assert_equal 2 (poll q); (* [3] *)
    assert_equal 3 (poll q); (* [] *)
    assert_raises (Failure "poll") (fun () -> poll q)
  );

])
