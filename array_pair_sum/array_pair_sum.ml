let array_pair_sum (xs:int list) (sum:int) : (int * int) list =
  (* Use a hashtable to keep track of the integers we've encountered before.
     The key is the integer and the value is a boolean indicating whether the
     number has already been used in a pair. *)
  let ht = Hashtbl.create (List.length xs) in
  let fn acc x =
    let remainder = sum - x in
    let acc =
      (* Check if `remainder` exists in `ht`. If yes, and if it has not
         been used in a pair before, we have found a new pair. We then mark the
         `remainder` as used. *)
      if Hashtbl.mem ht remainder && not (Hashtbl.find ht remainder) then
        let _ = Hashtbl.replace ht remainder true in
        (x, remainder)::acc
      else
        acc in
    let _ =
      (* Check if `x` exists in `ht`. If no, add `x` to `ht`. *)
      if not (Hashtbl.mem ht x) then
        Hashtbl.add ht x false in
    acc in
  List.fold_left fn [] xs
