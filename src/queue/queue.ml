exception Empty

type 'a queue = ('a list) ref

let create () : 'a queue = ref []

let enqueue (x:'a) (s:'a queue) : unit =
  let rec aux s =
    match s with
      | [] -> [x]
      | x::xs -> x::(aux xs) in
  s := aux !s

let poll (s:'a queue) : 'a =
  match (!s) with
    | [] -> raise Empty
    | x::xs ->
      let _ = s := xs in
      x
