open Byte_format
open OUnit2

let () = run_test_tt_main ("byte_format n precision" >::: [

  "`n` < 0" >:: (fun _ ->
    assert_raises (Failure "n < 0") (fun () -> byte_format (-1) 0)
  );

  "`precision` < 0" >:: (fun _ ->
    assert_raises (Failure "precision < 0") (fun () -> byte_format 42 (-1))
  );

  "B" >:: (fun _ ->
    let n = 42 in
    assert_equal "42 B" (byte_format n 0);
    assert_equal "42.0 B" (byte_format n 1);
    assert_equal "42.000 B" (byte_format n 3)
  );

  "KB" >:: (fun _ ->
    let n = 8101 in
    assert_equal "8 KB" (byte_format n 0);
    assert_equal "7.9 KB" (byte_format n 1);
    assert_equal "7.911 KB" (byte_format n 3)
  );

  "MB" >:: (fun _ ->
    let n = 156833213 in
    assert_equal "150 MB" (byte_format n 0);
    assert_equal "149.6 MB" (byte_format n 1);
    assert_equal "149.568 MB" (byte_format n 3)
  );

  "GB" >:: (fun _ ->
    let n = 9876543210 in
    assert_equal "9 GB" (byte_format n 0);
    assert_equal "9.2 GB" (byte_format n 1);
    assert_equal "9.198 GB" (byte_format n 3)
  );

  "TB" >:: (fun _ ->
    let n = 123456789123456789 in
    assert_equal "112283 TB" (byte_format n 0);
    assert_equal "112283.3 TB" (byte_format n 1);
    assert_equal "112283.296 TB" (byte_format n 3)
  );

])
