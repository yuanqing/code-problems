let quick_sort (compare:'a -> 'a -> int) (xs:'a list) : 'a list =
  let rec partition xs pivot acc bcc =
    (* Partition `xs` into a pair of lists: `acc` containing elements smaller
       than the `pivot`, and `bcc` containing elements greater than the
       pivot. *)
    match xs with
      | [] ->
        (* We must reverse each list in order to maintain their original
           ordering in the original list. *)
        List.rev acc, List.rev bcc
      | x::xs when compare x pivot < 0 ->
        (* `compare` returning a negative value means that `x` is smaller
            than `pivot`, so we cons `x` to `acc`. *)
        partition xs pivot (x::acc) bcc
      | x::xs ->
        (* Otherwise, cons `x` to `bcc`. *)
        partition xs pivot acc (x::bcc) in
  let rec aux xs =
    match xs with
      | [] -> []
      | x::xs ->
        let ys, zs = partition xs x [] [] in
        (aux ys)@(x::(aux zs)) in
  aux xs
