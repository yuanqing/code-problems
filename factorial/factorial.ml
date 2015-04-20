let factorial =
  (* Because we have a closure, `ht` persists across calls to `factorial`. *)
  let ht = ref (Hashtbl.create 100) in
  let _ = Hashtbl.add (!ht) 0 (Big_int.big_int_of_int 1) in
  let max = ref 1 in
  fun (n:int) ->
    if n < 0 then
      failwith "n < 0"
    else
      let ht = !ht in
      try
        (* Check if `ht` contains the value of `factorial n`. Return it
           if so. *)
        Hashtbl.find ht n
      with Not_found ->
        let rec aux i n =
          let x = Big_int.mult_int_big_int i (Hashtbl.find ht (i - 1)) in
          if i = n then
            x
          else
            let () = Hashtbl.add ht i x in
            aux (i + 1) n in
        let result = aux !max n in
        (* Update `max`, and return the `result`. *)
        let _ = max := n in
        result
