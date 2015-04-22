let string_rotation (x:string) (y:string) : bool =
  match () with
    | _ when x = y -> true
    | _ when String.length x != String.length y -> false
    | _ ->
      let len = String.length x in
      let rec aux z =
        let z = (String.sub z 1 (len-1)) ^ String.sub z 0 1 in
        match z with
          | _ when z = x -> false (* We are back at the original string. *)
          | _ when z = y -> true
          | _ -> aux z in
      aux x
