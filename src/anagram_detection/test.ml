open Anagram_detection
open OUnit2

let () = run_test_tt_main ("anagram_detection parent child" >::: [

  "empty `parent`" >:: (fun _ ->
    assert_equal 0 (anagram_detection "" "dAn");
  );

  "empty `child`" >:: (fun _ ->
    assert_raises (Failure "child string must be non-empty")
        (fun () -> anagram_detection "Adn" "");
  );

  "`parent` equals `child`" >:: (fun _ ->
    assert_equal 1 (anagram_detection "Adn" "dAn");
  );

  "`parent` shorter than `child`" >:: (fun _ ->
    assert_equal 0 (anagram_detection "cAda" "AbrAcadAbRa");
  );

  "`parent` longer than `child`" >:: (fun _ ->
    assert_equal 2 (anagram_detection "AbrAcadAbRa" "cAda");
    assert_equal 4 (anagram_detection "AdnBndAndBdaBn" "dAn");
  );

])
