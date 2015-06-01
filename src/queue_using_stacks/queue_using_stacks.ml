type 'a t = ('a Stack.t * 'a Stack.t) ref

let create () : 'a t = ref (Stack.create (), Stack.create ())

let enqueue (x:'a) (q:'a t) : unit =
  (* push `x` onto `s1` *)
  let s1, s2 = !q in
  let () = Stack.push x s1 in
  q := (s1, s2)

let poll (q:'a t) : 'a =
  let s1, s2 = !q in
  if Stack.is_empty s2 then
    if Stack.is_empty s1 then
      failwith "poll"
    else
      (* pop from `s1`, push to `s2` *)
      let rec aux s1 =
        let x = Stack.pop s1 in
        if Stack.is_empty s1 then
          (* `x` is the bottom-most item in `s1` *)
          let () =
            q := (s2, s1) in
          x
        else
          let () = Stack.push x s2 in
          aux s1 in
      aux s1
  else
    Stack.pop s2
