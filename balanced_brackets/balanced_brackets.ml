exception Unbalanced

(* `br` is a map of each opening bracket to its corresponding closing
   bracket. *)
module Brackets = Map.Make (Char)
let br = Brackets.empty
let br = Brackets.add '(' ')' br
let br = Brackets.add '[' ']' br
let br = Brackets.add '{' '}' br

let balanced_brackets (str:string) : bool =
  (* `stk` is for storing opening brackets encountered as we iterate over the
     characters in `str` *)
  let stk = Stack.create () in
  (* Iterate over the characters in `str`. Throw `Unbalanced` if `str`
     has unbalanced brackets. *)
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
