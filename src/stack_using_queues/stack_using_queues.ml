type 'a t = ('a Queue.t * 'a Queue.t) ref

let create () : 'a t = ref (Queue.create (), Queue.create ())

let push (x:'a) (s:'a t) : unit =
  (* enqueue `x` in `q1` *)
  let q1, q2 = !s in
  let () = Queue.add x q1 in
  s := (q1, q2)

let pop (s:'a t) : 'a =
  let q1, q2 = !s in
  if Queue.is_empty q1 then
    failwith "pop"
  else
    (* take from `q1`, add to `q2` *)
    let rec aux q1 =
      let x = Queue.take q1 in
      if Queue.is_empty q1 then
        (* `x` is the last item in `q1` *)
        let () =
          s := (q2, q1) in
        x
      else
        let () = Queue.add x q2 in
        aux q1 in
    aux q1
