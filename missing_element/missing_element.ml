let missing_element (xs:'a list) (ys:'a list) : 'a =
  let ht = Hashtbl.create (List.length ys) in
  let fn y = Hashtbl.add ht y () in
  let _ = List.iter fn ys in
  let rec aux xs =
    match xs with
      | [] -> failwith "impossible"
      | x::xs ->
        if not (Hashtbl.mem ht x) then
          x
        else
          let _ = Hashtbl.remove ht x in
          aux xs in
  aux xs
