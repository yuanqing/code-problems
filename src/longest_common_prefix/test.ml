open Longest_common_prefix
open OUnit2

let () = run_test_tt_main ("longest_common_prefix xs" >::: [

  "empty `xs`" >:: (fun _ ->
    assert_raises (Failure "empty list") (fun x -> longest_common_prefix [])
  );

  "longest common prefix is the empty string" >:: (fun _ ->
    assert_equal "" (longest_common_prefix [""  ; "a" ; "aa"]);
    assert_equal "" (longest_common_prefix ["aa"; ""  ; "a" ]);
    assert_equal "" (longest_common_prefix ["a" ; "aa"; ""  ]);
  );

  "longest common prefix is the non-empty string" >:: (fun _ ->
    assert_equal "go" (longest_common_prefix ["go"  ; "goo" ; "good"]);
    assert_equal "go" (longest_common_prefix ["goo" ; "go"  ; "good"]);
    assert_equal "go" (longest_common_prefix ["good"; "goo" ; "go"  ])
  );

])
