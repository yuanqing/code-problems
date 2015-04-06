open Big_int

let ht = Hashtbl.create 100

let _ = Hashtbl.add ht 1 (big_int_of_int 0)
let _ = Hashtbl.add ht 2 (big_int_of_int 1)

let fib n : big_int =
  if n < 1 then
    failwith "n < 1"
  else
    try
      Hashtbl.find ht n
    with Not_found ->
      let rec aux i n =
        let x = add_big_int (Hashtbl.find ht (i - 1))
            (Hashtbl.find ht (i - 2)) in
          if i = n then
            x
          else
            let () = Hashtbl.add ht i x in
            aux (i + 1) n
      in (aux 3 n)
