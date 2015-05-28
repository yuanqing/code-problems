let sum_of_multiples (xs:int list) (n:int) : int =
  if List.length xs = 0 then
    failwith "no multiples"
  else if n < 0 then
    failwith "n < 0"
  else
    (* Iterate from 1 to `n`. *)
    let rec aux i =
      if i >= n then
        0
      else
        (* Check if `i` is a multiple of each `x`. Add `i` to the sum if
           yes. *)
        let rec check xs =
          match xs with
            | [] -> 0
            | x::_ when i mod x = 0 -> i
            | _::xs -> check xs in
        check xs + aux (i+1) in
    aux 1
