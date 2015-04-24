type 'a tree =
  | Empty
  | Node of 'a * 'a tree * 'a tree

let pre_order (x:'a tree) : 'a list =
  let rec aux l rs =
    (* Accumulate the right children in `rs` to allow tail recursion. *)
    match l with
      | Empty ->
        begin match rs with
          | [] -> []
          | r::rs -> aux r rs
        end
      | Node (v, l, r) -> v::(aux l (r::rs)) in
  aux x []

let post_order (x:'a tree) : 'a list =
  let rec aux r ls vs =
    (* Accumulate the left children in `ls` to allow tail recursion. We also
    use `vs` to accumulate values to avoid having to do a `List.rev` on
    the final result. *)
    match r with
      | Empty ->
        begin match ls with
          | [] -> vs
          | l::ls -> aux l ls vs
        end
      | Node (v, l, r) -> aux r (l::ls) (v::vs) in
  aux x [] []
