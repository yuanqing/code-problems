let longest_words (sentence:string) : string list =
  (* Split `sentence` on whitespace.  *)
  let regexp = Str.regexp "[ ]+" in
  let words = Str.split regexp sentence in
  (* Initialise `ht`. *)
  let ht = Hashtbl.create (List.length words) in
  let rec aux xs max : string list =
    match xs with
      | [] ->
        let fn _ word acc =
          word::acc in
        Hashtbl.fold fn ht []
      | x::xs ->
        let len = String.length x in
        if len >= max then
          (* If the `word` is longer than the current `max`, clear the `ht` and
             update the `max`. *)
          let () = if len > max then
            Hashtbl.clear ht in
          (* Add `word` into `ht` only if it's lowercase representation doesn't
             already exist in `ht`. *)
          let lowercase_word = String.lowercase x in
          let () = if not (Hashtbl.mem ht lowercase_word) then
            Hashtbl.add ht lowercase_word x in
          aux xs (if len > max then len else max)
        else
          aux xs max in
  aux words (-1)
