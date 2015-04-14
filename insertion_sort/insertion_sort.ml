let insertion_sort (comp:'a -> 'a -> int) (xs:'a list) : 'a list =
  let rec insert comp x ys =
    match ys with
      | [] -> [x]
      | y::ys as zs when (comp x y < 0) -> x::zs
        (* Insert `x` before `zs` if the comparator function returns a
           negative value. *)
      | y::ys -> y::(insert comp x ys) in
        (* Otherwise, continue looking for a place to insert `x` in the
           remainder of the list. *)
  let rec aux xs =
    match xs with
      | [] -> []
      | x::xs -> insert comp x (aux xs) in
  aux xs
