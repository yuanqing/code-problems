let insertion_sort (comp:'a -> 'a -> int) (xs:'a list) : 'a list =
  let rec insert comp x ys =
    match ys with
      | [] -> [x]
      | y::ys as zs when (comp x y < 0) ->
        (* `comp` returning a negative value means that `x` is less than
           `y`. So we place `x` in front of both `y` and `ys`. *)
        x::zs
      | y::ys ->
        (* Otherwise, continue looking for a place to insert `x` in the
           rest of the list. *)
        y::(insert comp x ys) in
  let rec aux xs =
    match xs with
      | [] -> []
      | x::xs -> insert comp x (aux xs) in
  aux xs
