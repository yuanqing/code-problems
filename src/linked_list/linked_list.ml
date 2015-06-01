type 'a node =
  | None
  | Some of 'a * 'a node

type 'a t = ('a node) ref

let create () : 'a t = ref None

let from_list (xs:'a list) : 'a t =
  let rec aux xs =
    match xs with
      | [] -> None
      | y::ys -> (Some (y, aux ys)) in
  ref (aux xs)

let to_list (xs:'a t) : 'a list =
  let rec aux xs =
    match xs with
      | None -> []
      | Some (y, ys) -> y::(aux ys) in
  aux !xs

let nth (n:int) (xs:'a t) : 'a =
  if (n < 0) then
    failwith "nth"
  else
    let rec aux i xs =
      match xs with
        | None -> failwith "nth"
        | Some (y, ys) ->
          if i == n then
            y
          else
            aux (i+1) ys in
    aux 0 !xs

let add_first (x:'a) (xs:'a t) : 'a =
  let () =
    xs := match !xs with
      | None -> Some (x, None)
      | ys -> Some (x, ys) in
  x

let add_last (x:'a) (xs:'a t) : 'a =
  let rec aux xs =
    match xs with
      | None -> Some (x, None)
      | Some (y, ys) -> Some (y, aux ys) in
  let () =
    xs := aux !xs in
  x

let remove_first (xs:'a t) : 'a =
  match !xs with
    | None -> failwith "remove_first"
    | Some (y, ys) ->
      let () =
        xs := ys in
      y

let remove_last (xs:'a t) : 'a =
  let rec aux ys =
    match ys with
      | None -> (* empty list *)
        failwith "remove_last"
      | Some (y, None) -> (* one item *)
        (y, None)
      | Some (y, Some (z, None)) -> (* two items *)
        (z, Some (y, None))
      | Some (y, ys) -> (* more than two items *)
        let (z, zs) = aux ys in
        (z, Some (y, zs)) in
  let (y, ys) = aux !xs in
  let () =
    xs := ys in
  y

let insert (x:'a) (n:int) (xs:'a t) : 'a =
  if (n < 0) then
    failwith "insert"
  else
    let rec aux i xs =
      if i == n then
        match xs with
          | None -> Some (x, None)
          | y -> Some (x, y)
      else
        match xs with
          | None -> failwith "insert"
          | Some (y, ys) -> Some (y, aux (i+1) ys) in
    let () =
      xs := aux 0 !xs in
    x

let reverse (xs:'a t) : unit =
  let rec aux xs acc =
    match xs with
      | None -> acc
      | Some (y, ys) -> aux ys (Some (y, acc)) in
  xs := aux !xs None
