type 'a t = ('a list) ref

let create () : 'a t = ref []

let push (x:'a) (s:'a t) : unit =
  s := x::(!s)

let pop (s:'a t) : 'a =
  match (!s) with
    | [] -> failwith "pop"
    | x::xs ->
      let _ = s := xs in
      x
