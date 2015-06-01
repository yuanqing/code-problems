exception Empty

type 'a stack = ('a list) ref

let create () : 'a stack = ref []

let push (x:'a) (s:'a stack) : unit =
  s := x::(!s)

let pop (s:'a stack) : 'a =
  match (!s) with
    | [] -> raise Empty
    | x::xs ->
      let _ = s := xs in
      x
