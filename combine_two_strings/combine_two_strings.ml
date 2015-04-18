let combine_two_strings (x:string) (y:string) (z:string) : bool =
  let rec aux x y z =
    let x_len = String.length x in
    let y_len = String.length y in
    let z_len = String.length z in
    if x_len + y_len <> z_len then
      (* The total length of `x` and `y` must equal the length of `z`. *)
      false
    else if (x_len = 0 || y_len = 0) then
      (* If either `x` or `y` are empty, then the concatenation of the two
         must equal `z`. *)
      x ^ y = z
    else
      let z_sub = String.sub z 1 (z_len - 1) in
      if x.[0] = z.[0] then
        (* Match the first characters of `x` and `z`. *)
        aux (String.sub x 1 (x_len - 1)) y z_sub
      else if y.[0] = z.[0] then
        (* Match the first characters of `y` and `z`. *)
        aux x (String.sub y 1 (y_len - 1)) z_sub
      else
        (* If neither pairs match, it is not possible to combine `x` and `y`
           to form `z`. *)
        false in
  aux x y z
