let remove_duplicate_characters (str:string) : string =
  let len = String.length str in
  let ht = Hashtbl.create len in
  let rec aux str i =
    if i = len then
      ""
    else
      let c = str.[i] in
      if Hashtbl.mem ht c then
        aux str (i+1)
      else
        let _ = Hashtbl.add ht c () in
        (String.make 1 c) ^ (aux str (i+1)) in
  aux str 0
