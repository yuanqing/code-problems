exception Empty

type 'a t = ('a list) ref

let create () : 'a t = ref []

let enqueue (x:'a) (s:'a t) : unit =
  let rec aux s =
    match s with
      | [] -> [x]
      | x::xs -> x::(aux xs) in
  s := aux !s

let poll (s:'a t) : 'a =
  match (!s) with
    | [] -> raise Empty
    | x::xs ->
      let _ = s := xs in
      x
