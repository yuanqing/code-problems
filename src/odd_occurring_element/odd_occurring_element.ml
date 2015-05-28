let odd_occurring_element (xs:'a list) : 'a =
  let ht = Hashtbl.create (List.length xs) in
  let rec aux xs =
    match xs with
      | [] ->
        (* Unpack the odd-occurring element from `ht`. *)
        let fn elem _ _ = [elem] in
        begin match Hashtbl.fold fn ht [] with
          | x::_ -> x
          | _ -> failwith "No odd-occurring element"
        end
      | x::xs ->
        let () =
          if not (Hashtbl.mem ht x) then
            (* Element not encountered before, or occurred an even number of
            times so far. *)
            Hashtbl.add ht x ()
          else
            (* Element encountered before an odd number of times, so remove
            it from `ht`. *)
            Hashtbl.remove ht x in
        aux xs in
  aux xs
