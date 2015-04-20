let money_format (n:float) : string =
  if n < 0. then
    failwith "n < 0"
  else
    let f, i = modf n in
    let f = "." ^ String.sub (Printf.sprintf "%.2f" f) 2 2 in
    let rec aux i acc =
      if i < 1000 then
        (string_of_int i) ^ acc
      else
        let str = Printf.sprintf "%03d" (i mod 1000) in
        aux (i / 1000) (" " ^ str ^ acc) in
    aux (int_of_float i) f
