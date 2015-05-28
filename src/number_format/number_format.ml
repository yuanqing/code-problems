let number_format (n:int) : string =
  let rec aux n =
    if n < 1000 then
      string_of_int n
    else
      let str = Printf.sprintf "%03d" (n mod 1000) in
      aux (n / 1000) ^ "," ^ str in
  let prefix = if n < 0 then "-" else "" in
  prefix ^ aux (abs n)
