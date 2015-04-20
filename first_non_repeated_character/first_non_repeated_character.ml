let first_non_repeated_character (str:string) : char =
  let len = String.length str in
  if len = 0 then
    failwith "empty string"
  else
    let rec aux i =
      let is_last = i = len - 1 in
      let c = str.[i] in
      if (i = 0 || c <> str.[i-1]) && (is_last || c <> str.[i+1]) then
        c
      else if is_last then
        failwith "no non-repeated character"
      else
        aux (i+1) in
    aux 0
