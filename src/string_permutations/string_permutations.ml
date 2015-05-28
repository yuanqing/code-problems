let permute (str:string) : string list =
  (* Compute the result of inserting `c` at every possible position within
  the given `str`. *)
  let insert str c =
    let rec aux left right c =
      if right = "" then
        [left ^ c]
      else
        let str = left ^ c ^ right in
        let left = left ^ (String.sub right 0 1) in
        let right = String.sub right 1 ((String.length right) - 1) in
        str::(aux left right c) in
    aux "" str (String.make 1 c) in
  let rec aux str =
    match String.length str with
      | 0 -> []
      | 1 -> [str]
      | len ->
        let c = str.[0] in
        let substr = String.sub str 1 (len-1) in
        let fn acc x = (insert x c)@acc in
        List.fold_left fn [] (aux substr) in
    aux str
