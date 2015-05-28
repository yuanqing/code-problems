exception Unbalanced

let balanced_brackets : string -> bool =
  (* `br` is a map of each opening bracket to its corresponding closing
     bracket. *)
  let module Brackets = Map.Make (Char) in
  let br = Brackets.empty in
  let br = Brackets.add '(' ')' br in
  let br = Brackets.add '[' ']' br in
  let br = Brackets.add '{' '}' br in
  fun (str:string) ->
    (* `stk` is for storing opening brackets encountered as we iterate over the
       characters in `str` *)
    let stk = Stack.create () in
    (* Iterate over the characters in `str`. Throw `Unbalanced` to
       short-circuit the execution the moment we find that `str` has unbalanced
       brackets. *)
    try
      let f c =
        match c with
          | '(' | '[' | '{' ->
            (* Push `c` onto the `stk` if it is an opening bracket. *)
            Stack.push c stk
          | ')' | ']' | '}' ->
            (* Otherwise, pop from the `stk` and check that the `popped`
               character is the opening bracket of `c`. If the brackets do not
               corresponding or if `stk` is empty, we immediately throw an
               `Unbalanced` exception. *)
            begin
              try
                let popped = Stack.pop stk in
                if c != Brackets.find popped br then
                  raise Unbalanced
              with Stack.Empty ->
                raise Unbalanced
            end
          | _ -> ()
        in
      let () = String.iter f str in
      (* If we have not thrown an `Unbalanced` exception at this point, all
         that's left is to check that `stk` is empty. `stk` being non-empty
         implies that some opening brackets did not have corresponding closing
         brackets. *)
      Stack.is_empty stk
    with Unbalanced ->
      false
