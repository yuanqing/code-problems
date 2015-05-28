let integer_difference (n:int) (xs:int list) : int =
  (* Populate `ht`. Keys are the integers and values are the number of
     occurrences of the integer. *)
  let ht = Hashtbl.create (List.length xs) in
  let fn x =
    if Hashtbl.mem ht x then
      Hashtbl.replace ht x (1 + Hashtbl.find ht x)
    else
      Hashtbl.add ht x 1 in
  let _ = List.iter fn xs in
  (* Lookup the `diff` of each integer and increment `acc` accordingly. *)
  let fn acc x =
    let diff = n + x in
    if Hashtbl.mem ht diff then
      acc + Hashtbl.find ht diff
    else
      acc in
  List.fold_left fn 0 xs
