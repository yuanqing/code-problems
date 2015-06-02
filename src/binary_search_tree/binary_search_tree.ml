type 'a node =
  | Empty
  | Node of 'a * 'a node * 'a node

type 'a t = ('a node * ('a -> 'a -> int)) ref

let leaf (v:'a) : 'a node =
  Node (v, Empty, Empty)

let create (compare:'a -> 'a -> int) : 'a t =
  ref (Empty, compare)

let naive_size (x:'a t) : int =
  let rec aux x =
    match x with
      | Empty -> 0
      | Node (_, l, r) -> 1 + (aux l) + (aux r) in
  aux (fst !x)

let size (x:'a t) : int =
  let rec aux x rs acc =
    match x with
      | Empty ->
        (* If the current node is empty, traverse its sibling (ie. the parent
        node's right child). *)
        begin
          match rs with
            | [] -> acc
            | r::rs -> aux r rs acc
        end
      | Node (_, l, r) ->
        (* Traverse the left child, accumulating the right child in `rs` to allow
        tail recursion. *)
        aux l (r::rs) (acc + 1) in
  aux (fst !x) [] 0

let naive_height (x:'a t) : int =
  let rec aux x =
    match x with
      | Empty -> (-1)
      | Node (_, l, r) ->
        let lh = 1 + aux l in
        let rh = 1 + aux r in
        if lh > rh then lh
        else rh in
  aux (fst !x)

let height (x:'a t) : int =
  let rec aux x acc =
    match x with
      | Empty -> acc
      | Node (_, Empty, r) ->
        aux r (acc + 1)
      | Node (_, l, Empty) ->
        aux l (acc + 1)
      | Node (_, l, r) ->
        (* This is only partially tail-recursive. *)
        let acc = acc + 1 in
        let lh = aux l acc in
        let rh = aux r acc in
        if lh > rh then
          lh
        else
          rh in
  aux (fst !x) (-1)

let inorder_predecessor (x:'a t) : 'a =
  (* Right-most node of the left tree. *)
  let l =
    match (fst !x) with
      | Empty -> failwith "inorder_predecessor"
      | Node (_, l, _) -> l in
  let rec aux x =
    match x with
      | Empty -> failwith "inorder_predecessor"
      | Node (_, _, r) when r != Empty -> aux r
      | Node (v, _, _) -> v in
  aux l

let inorder_successor (x:'a t) : 'a =
  (* Left-most node of the right tree. *)
  let r =
    match (fst !x) with
      | Empty -> failwith "inorder_successor"
      | Node (_, _, r) -> r in
  let rec aux x =
    match x with
      | Empty -> failwith "inorder_successor"
      | Node (_, l, _) when l != Empty -> aux l
      | Node (v, _, _) -> v in
  aux r

let search (v:'a) (x:'a t) : bool =
  let y, compare = !x in
  let rec aux x =
    match x with
      | Empty -> false
      | Node (w, l, r) ->
        if w == v then
          (* Found `v`. *)
          true
        else if compare v w < 0 then
          (* `compare` returning a negative value means that `v` is smaller
          than `w`, so search for `v` in the left tree ie. `l`. *)
          aux l
        else
          (* Otherwise, search for `v` in the right tree ie. `r`. *)
          aux r in
  aux y

let insert (v:'a) (x:'a t) : 'a =
  let y, compare = !x in
  let rec aux x =
    match x with
      | Empty -> Node (v, Empty, Empty)
      | Node (w, l, r) ->
        if compare v w < 0 then
          (* `compare` returning a negative value means that `v` is smaller
          than `w`, so insert `v` into the left tree ie. `l`. *)
          Node (w, aux l, r)
        else
          (* Otherwise, insert `v` into the right tree ie. `r`. *)
          Node (w, l, aux r) in
  let () =
    x := (aux y, compare) in
  v

let delete (v:'a) (x:'a t) : 'a =
  let y, compare = !x in
  let rec aux v x =
    match x with
      | Empty -> failwith "delete"
      | Node (w, l, r) as z when w == v ->
        (* Found `v`. *)
        begin match (l, r) with
          | Empty, Empty -> Empty
          | Empty, _ ->
            (* Replace the current node with its right child. *)
            r
          | _, Empty ->
            (* Replace the current node with its left child. *)
            l
          | _ ->
            (* Find the inorder predecessor of `z`. *)
            let ip = inorder_predecessor (ref (z, compare)) in
            (* Remove it from the tree, then use its value for the current
            node. *)
            match aux ip z with
              | Node (w, l, r) -> Node (ip, l, r)
              | _ -> failwith "delete"
        end
      | Node (w, l, r) ->
        if compare v w < 0 then
          (* `compare` returning a negative value means that `v` is smaller
          than `w`, so remove `v` from the left tree ie. `l`. *)
          Node (w, aux v l, r)
        else
          (* Otherwise, remove `v` from the right tree ie. `r`. *)
          Node (w, l, aux v r) in
  let () =
    x := (aux v y, compare) in
  v
