let longest_common_prefix (xs:string list) : string =
  match xs with
    | [] -> failwith "empty list"
    | x::xs ->
      let len = ref (String.length x) in
      (* Compute all possible prefixes of the string `x`. *)
      let ys =
        let rec prefix str len =
          if len == 0 then
            []
          else
            (String.sub str 0 len)::(prefix str (len-1)) in
        List.rev (prefix x !len) in
      (* Iterate over rest of the list ie. `xs`. Compare each string with
         a substring of `x` of the same length. *)
      let fn x =
        let _ = len := min (String.length x) !len in
        let rec prefix str i =
          if i > !len then
            ()
          else
            if String.sub x 0 i <> List.nth ys (i-1) then
              len := i - 1
            else
              prefix str (i+1) in
        prefix x 1 in
      let _ = List.iter fn xs in
      String.sub x 0 !len
