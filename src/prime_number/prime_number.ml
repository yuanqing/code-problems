let prime_number =
  (* Because we have a closure, `ht` persists across calls to
  `prime_number`. *)
  let ht = ref (Hashtbl.create 100) in
  fun (n:int) ->
    if n < 2 then
      false
    else
      let ht = !ht in
      try
        (* Check if `ht` contains the value of `prime_number n`. Return it
         if so. *)
        Hashtbl.find ht n
      with Not_found ->
        (* Try to divide `n` by numbers from 2 up to the square root of `n`. If
        none of the numbers divide `n`, conclude that `n` is prime. *)
        let max = int_of_float (sqrt (float_of_int n)) in
        let rec aux i =
          if i > max then
            true
          else if n mod i = 0 then
            false
          else
            aux (i+1) in
        let result = aux 2 in
        (* Add `result` to `ht` before returning it. *)
        let _ = Hashtbl.add ht n result in
        result
