type 'a tree =
  | Empty
  | Node of 'a * 'a tree * 'a tree

let naive_pre_order (x:'a tree) : 'a list =
  let rec aux x =
    match x with
      | Empty -> []
      | Node (v, l, r) -> v::(aux l)@(aux r) in
  aux x

let pre_order (x:'a tree) : 'a list =
  let rec aux l rs =
    match l with
      | Empty ->
        (* If the current node is empty, traverse its sibling (ie. the parent
        node's right child). *)
        begin match rs with
          | [] -> []
          | r::rs -> aux r rs
        end
      | Node (v, l, r) ->
        (* Prepend `v`, the value of the current node to the result. Then
        traverse its left child, accumulating its right child in `rs` to allow
        tail recursion. *)
        v::(aux l (r::rs)) in
  aux x []

let naive_post_order (x:'a tree) : 'a list =
  let rec aux x =
    match x with
      | Empty -> []
      | Node (v, l, r) -> (aux l)@(aux r)@[v] in
  aux x

let post_order (x:'a tree) : 'a list =
  let rec aux r ls vs =
    match r with
      | Empty ->
        (* If the current node is empty, traverse its sibling (ie. the parent
        node's left child). *)
        begin match ls with
          | [] -> vs
          | l::ls -> aux l ls vs
        end
        (* Traverse the current node's right child, accumulating its left
        child in `ls` and its value in `vs` to allow tail recursion. *)
      | Node (v, l, r) -> aux r (l::ls) (v::vs) in
  aux x [] []

let naive_in_order (x:'a tree) : 'a list =
  let rec aux x =
    match x with
      | Empty -> []
      | Node (v, l, r) -> (aux l)@(v::(aux r)) in
  aux x

let in_order (x:'a tree) : 'a list =
  let rec aux l rs vs =
    match l with
      | Empty ->
        (* If the current node is empty, prepend `v`, the value of its parent
        node to the result, then traverse its sibling (ie. the parent node's
        right child). *)
        begin match rs with
          | [] -> []
          | r::rs ->
            begin match vs with
              | [] -> []
              | v::vs -> v::(aux r rs vs)
            end
        end
      | Node (v, l, r) ->
        (* Traverse the left child. Accumulate the right children in `rs` and
        the value of the current node in `vs`. *)
        aux l (r::rs) (v::vs) in
  aux x [] []

let level_order (x:'a tree) : 'a list =
  (* Initialise a `q` containing `x` ie. the root. *)
  let q = Queue.create () in
  let _ = Queue.add x q in
  let rec aux q =
    if Queue.is_empty q then
      []
    else
      (* Remove the head of the queue, prepend its value to the result and
      add its left and right children to the queue. *)
      match Queue.take q with
        | Empty -> aux q
        | Node (v, l, r) ->
          let _ = Queue.add l q in
          let _ = Queue.add r q in
          v::(aux q) in
  aux q

let level_order_list (x:'a tree) : 'a list list =
  (* Initialise a `q` containing `x` ie. the root. *)
  let q = Queue.create () in
  let _ = Queue.add x q in
  let rec aux acc q curr next =
    if Queue.is_empty q then
      [acc]
    else
      (* Remove the head of the queue, prepend its value to the result and
      add its left and right children to the queue. *)
      match Queue.take q with
        | Empty -> aux acc q curr next
        | Node (v, l, r) ->
          let _ = Queue.add r q in
          let _ = Queue.add l q in
          let curr = curr - 1 in
          let next = next + 2 in
          if curr = 0 then
            let curr, next = next, 0 in
            (v::acc)::(aux [] q curr next)
          else
            aux (v::acc) q curr next in
  aux [] q 1 0
