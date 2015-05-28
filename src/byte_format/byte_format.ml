let byte_format (n:int) (precision:int) : string =
  if n < 0 then
    failwith "n < 0"
  else if precision < 0 then
    failwith "precision < 0"
  else
    let n = float_of_int n in
    let units = [ "B"; "KB"; "MB"; "GB"; "TB" ] in
    let rec aux n i =
      if n >= 1024. && i < 4 then
        aux (n /. 1024.) (i + 1)
      else
        let fmt = Scanf.format_from_string ("%." ^ string_of_int precision ^ "f %s") "%f %s" in
        Printf.sprintf fmt n (List.nth units i) in
    aux n 0
