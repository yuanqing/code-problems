let anagram_detection (parent:string) (child:string) : int =
  (* Convert `str` to a list of chars. *)
  let explode (str:string) : char list =
    let rec aux i acc =
      if i < 0 then
        acc
      else
        aux (i - 1) (str.[i]::acc) in
    aux ((String.length str) - 1) [] in
  (* Get the canonical representation of `str`, which is a simply a sorted list
     list of its characters. *)
  let canonical (str:string) : char list =
    let comparator x y =
      if x < y then -1
      else if x > y then 1
      else 0 in
    let chars = explode str in
    List.sort comparator chars in
  (* Fail if string is empty. *)
  let child_len = String.length child in
  let () =
    if child_len = 0 then
      failwith "child string must be non-empty" in
  (* Otherwise, iterate over the characters of `parent`. At each character,
     compute `sub_canonical`, a substring of length `child_len`, compare it
     with the `child_canonical` string and increment `count` if the two are
     the same. *)
  let child_canonical = canonical child in
  let parent_len = String.length parent in
  let rec aux i count =
    if i + child_len <= parent_len then
      let sub_canonical = canonical (String.sub parent i child_len) in
      let count =
        if sub_canonical = child_canonical then
          count + 1
        else
          count in
      aux (i + 1) count
    else
      count in
  aux 0 0
