let binary_search (compare:'a -> 'a -> int) (xs:'a list) (y:'a) : int =
  let rec aux low high =
    if low > high then
      -1
    else
      let mid = ((low + high) / 2) in
      match compare y (List.nth xs mid) with
        | -1 -> aux 0 (mid - 1)
        |  1 -> aux (mid + 1) high
        |  _ -> mid in
  aux 0 (List.length xs - 1)
