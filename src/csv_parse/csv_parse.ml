let csv_parse (str:string) : string list =
  let r = Str.regexp (
    "'[^']*'"    ^ "\\|" ^ (* single-quoted *)
    "\"[^\"]*\"" ^ "\\|" ^ (* double-quoted *)
    "[^,]+"                (* unquoted *)
  ) in
  let rec aux str =
    let len = String.length str in
    if len = 0 then
      []
    else
      try
        (* `i` and `j` are the start and end indices of the first token
           found in `str`. *)
        let i = Str.search_forward r str 0 in
        let j = Str.group_end 0 in
        (* Remove initial and trailing whitespace. *)
        let matched = String.trim (String.sub str i (j - i)) in
        let matched =
          (* Trim off the quotes. *)
          if matched <> "" then
            match matched.[0] with
              | '"' | '\'' ->
                String.sub matched 1 ((String.length matched) - 2)
              | _ -> matched
          else
            matched in
        (* Drop `matched` from `str`. *)
        let str = String.sub str j (len - j) in
        if matched = "" then
          (* Discard `matched` if it is empty. *)
          aux str
        else
          (* Otherwise, append `matched` to our result. *)
          matched::(aux str)
      with Not_found ->
        [] in
  aux str
