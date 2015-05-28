open Csv_parse
open OUnit2

let () = run_test_tt_main ("csv_parse str" >::: [

  "empty" >:: (fun _ ->
    assert_equal [] (csv_parse "");
  );

  "whitespace" >:: (fun _ ->
    assert_equal [] (csv_parse " ");
    assert_equal [] (csv_parse "  ");
  );

  "commas" >:: (fun _ ->
    assert_equal [] (csv_parse ",");
    assert_equal [] (csv_parse " ,");
    assert_equal [] (csv_parse ", ");
    assert_equal [] (csv_parse ",,");
    assert_equal [] (csv_parse " ,,");
    assert_equal [] (csv_parse ", ,");
    assert_equal [] (csv_parse ",, ");
    assert_equal [] (csv_parse " , ,");
    assert_equal [] (csv_parse " ,, ");
    assert_equal [] (csv_parse ", , ");
  );

  "unquoted" >:: (fun _ ->
    assert_equal ["foo"] (csv_parse "foo");
    assert_equal ["foo"] (csv_parse " foo ");
    assert_equal ["foo"] (csv_parse "foo,");
    assert_equal ["foo"] (csv_parse ",foo");
    assert_equal ["foo"] (csv_parse ",foo,");
  );

   "single-quoted" >:: (fun _ ->
    assert_equal ["foo"] (csv_parse "'foo'");
    assert_equal ["foo"] (csv_parse " 'foo' ");
    assert_equal ["foo"] (csv_parse "'foo',");
    assert_equal ["foo"] (csv_parse ",'foo'");
    assert_equal ["foo"] (csv_parse ",'foo',");
    assert_equal [" "] (csv_parse "' '");
    assert_equal ["\"foo\",bar"] (csv_parse "'\"foo\",bar'");
  );

  "double-quoted" >:: (fun _ ->
    assert_equal ["foo"] (csv_parse "\"foo\"");
    assert_equal ["foo"] (csv_parse " \"foo\" ");
    assert_equal ["foo"] (csv_parse "\"foo\",");
    assert_equal ["foo"] (csv_parse ",\"foo\"");
    assert_equal ["foo"] (csv_parse ",\"foo\",");
    assert_equal [" "] (csv_parse "\" \"");
    assert_equal ["'foo',bar"] (csv_parse "\"'foo',bar\"");
  );

  "multiple tokens" >:: (fun _ ->
    assert_equal ["foo"] (csv_parse "'', foo, \"\"");
    assert_equal ["foo"; "\"bar\""; "'baz'"] (csv_parse "foo, '\"bar\"', \"'baz'\"");
  );

])
