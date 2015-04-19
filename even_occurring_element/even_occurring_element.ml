let even_occurring_element (xs:'a list) : 'a =
  let ht = Hashtbl.create (List.length xs) in
  let rec aux xs =
    match xs with
      | [] ->
        (* Unpack the even-occurring element from `ht`. *)
        let fn elem count acc =
          if count mod 2 = 0 then
            elem::acc
          else
            acc in
        begin match Hashtbl.fold fn ht [] with
          | x::_ -> x
          | _ -> failwith "No even-occurring element"
        end
      | x::xs ->
        let () =
          if not (Hashtbl.mem ht x) then
            (* Element not encountered before. *)
            Hashtbl.add ht x 1
          else
            let count =
              if Hashtbl.find ht x = 1 then
                (* Previous count is odd, so new count is even. *)
                0
              else
                (* Previous count is even, so new count is odd. *)
                1 in
            Hashtbl.replace ht x count in
        aux xs in
  aux xs
