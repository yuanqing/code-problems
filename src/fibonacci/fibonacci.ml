let fib =
  (* Initialise a `ht` with the initial values. Because we have a closure,
     `ht` persists across calls to `fib`. *)
  let ht = ref (Hashtbl.create 100) in
  let _ = Hashtbl.add (!ht) 1 (Big_int.big_int_of_int 0) in
  let _ = Hashtbl.add (!ht) 2 (Big_int.big_int_of_int 1) in
  let max = ref 3 in
  fun (n:int) ->
    let ht = !ht in
    if n < 1 then
      failwith "n < 1"
    else
      try
        (* Check if `ht` contains the value of `fib n`. Return it if so. *)
        Hashtbl.find ht n
      with Not_found ->
        (* Otherwise, compute `fib n` starting from the current `max`, adding
           each intermediate value to the `ht`. *)
        let rec aux i n =
          let x = Big_int.add_big_int (Hashtbl.find ht (i - 1))
              (Hashtbl.find ht (i - 2)) in
          if i = n then
            x
          else
            let () = Hashtbl.add ht i x in
            aux (i + 1) n in
        let result = aux !max n in
        (* Update `max`, and return the `result`. *)
        let _ = max := n in
        result
