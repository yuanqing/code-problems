let bubble_sort (comp:'a -> 'a -> int) (xs:'a list) : 'a list =
  let rec bubble xs =
    match xs with
      | [] -> []
      | x::y::xs when (comp x y > 0) ->
        (* `comp` returning a positive value means that `x` is greater than
           `y`. We swap the positions of `x` and `y`, and call `bubble` on the rest of the list. *)
        y::x::(bubble xs)
      | x::xs ->
        (* Otherwise, just call `bubble` on the rest of the list. *)
        x::(bubble xs) in
  let rec aux xs i =
    (* Call `bubble` on the list `n` times, where `n` is the length of the
       list. *)
    if i > 0 then
      aux (bubble xs) (i - 1)
    else
      xs
  in aux xs (List.length xs)
