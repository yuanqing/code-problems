let largest_continuous_sum (xs:'a list) : 'a =
  if List.length xs = 0 then
    0
  else
    let rec aux xs curr largest =
      match xs with
        | [] -> largest
        | x::xs ->
          let curr = max (curr + x) x in
          let largest = max curr largest in
          aux xs curr largest in
    aux xs 0 min_int
