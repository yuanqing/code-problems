let merge_sort (compare:'a -> 'a -> int) (xs:'a list) : 'a list =
  let rec merge xs ys =
    match xs, ys with
      | xs, [] -> xs
      | [], ys -> ys
      | x::xs, y::_ when compare x y < 0 ->
        (* `compare` returning a negative value means that `x` is less than
           `y`. So prepend `x` to the result of merging the rest of the two
           lists. *)
        x::(merge xs ys)
      | xs, y::ys ->
        (* Otherwise, prepend `y` to the result of merging the rest of the two
           lists. *)
        y::(merge xs ys) in
  let split xs =
    (* Split `xs` into two halves. *)
    let len = List.length xs / 2 in
    let rec aux xs acc i =
      match xs with
        | x::xs when i < len -> aux xs (x::acc) (i + 1)
        | _ -> List.rev acc, xs in
    aux xs [] 0 in
  let rec aux xs =
    match xs with
      | [] -> []
      | [x] -> xs
      | _ ->
        (* Split `xs` into two halves, call `aux` on each half and merge the
           two halves. *)
        let ys, zs = split xs in
        merge (aux ys) (aux zs) in
  aux xs
