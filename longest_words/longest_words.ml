let longest_words (sentence:string) : string list =
  (* Split `sentence` on whitespace.  *)
  let regexp = Str.regexp "[ ]+" in
  let words = Str.split regexp sentence in
  (* Initialise `ht` and `max`. *)
  let ht = Hashtbl.create (List.length words) in
  let max = ref (-1) in
  (* Iterate over each word, keeping track of the longest words. *)
  let fn word =
    let len = String.length word in
    let max_val = !max in
    if len >= max_val then
      let () =
        if len > max_val then
          (* If the `word` is longer than the current `max`, clear the `ht` and
             update the `max`. *)
          let _ = Hashtbl.clear ht in
          max := len in
      (* Add `word` into `ht` only if it's lowercase representation doesn't
         already exist in `ht`. *)
      let lowercase_word = String.lowercase word in
      try
        let _ = Hashtbl.find ht lowercase_word in ()
      with Not_found ->
        Hashtbl.add ht lowercase_word word
      in
  let () = List.iter fn words in
  (* Return the longest words as a list. *)
  let fn _ word acc =
    word::acc in
  Hashtbl.fold fn ht []
