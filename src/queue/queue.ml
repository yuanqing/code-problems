exception Empty

type 'a queue = ('a list) ref

let create () : 'a queue = ref []

let enqueue (x:'a) (s:'a queue) : unit =
  s := (!s)@[x]

let poll (s:'a queue) : 'a =
  match (!s) with
    | [] -> raise Empty
    | x::xs ->
      let _ = s := xs in
      x
