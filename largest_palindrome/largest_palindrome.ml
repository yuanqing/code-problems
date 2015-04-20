let largest_palindrome (str:string) : string =
  let rec is_palindrome str =
    if String.length str < 2 then
      true
    else
      let len = String.length str in
      if str.[0] = str.[len-1] then
        is_palindrome (String.sub str 1 (len - 2))
      else
        false in
  let len = String.length str in
  let rec aux i max =
    let max_len = String.length max in
    let substr_len = len - i in
    if i == len || substr_len < max_len then
      max
    else
      let rec sub len =
        let substr = String.sub str i len in
        if is_palindrome substr then
          aux (i+1) (if len <= max_len then max else substr)
        else
          sub (len-1) in
      sub substr_len in
  aux 0 ""
