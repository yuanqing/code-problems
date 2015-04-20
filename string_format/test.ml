open OUnit2
open String_format

let () = run_test_tt_main ("format str xs" >::: [

  "no `xs`" >:: (fun _ ->
    assert_equal "{0}" (format "{0}" [])
  );

  "interpolate a single value from `xs`" >:: (fun _ ->
    assert_equal "foo" (format "{0}" ["foo"])
  );

  "interpolate multiple values from `xs`" >:: (fun _ ->
    assert_equal "foo bar, foo baz"
        (format "{0} {1}, {0} {2}" ["foo"; "bar"; "baz"])
  );

  "resulting string is the same as the original `str`" >:: (fun _ ->
    assert_equal "{0} {1}, {0} {2}"
        (format "{0} {1}, {0} {2}" ["{0}"; "{1}"; "{2}"])
  );

])
