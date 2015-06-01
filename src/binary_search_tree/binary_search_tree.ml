type 'a t =
  | Empty
  | Node of 'a * 'a t * 'a t

let size (x:'a t) : int =
  let rec aux x rs acc =
    match x with
      | Empty ->
        begin
          match rs with
            | [] -> acc
            | r::rs -> aux r rs acc
        end
      | Node (_, x, r) -> aux x (r::rs) (acc + 1) in
  aux x [] 0
