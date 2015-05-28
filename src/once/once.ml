type 'a option =
  | Some of 'a
  | None

let once (fn:'a -> 'b) (n:int) : 'a -> 'b option =
  if n < 0 then
    failwith "n < 0"
  else
    let count = ref 0 in
    fun x ->
      if !count = n then
        None
      else
        let _ = incr count in
        Some (fn x)
