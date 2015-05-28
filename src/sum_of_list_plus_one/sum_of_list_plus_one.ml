let sum_of_list_plus_one (xs:int list) : int =
  let fn acc x = x + 1 + acc in
  List.fold_left fn 0 xs
