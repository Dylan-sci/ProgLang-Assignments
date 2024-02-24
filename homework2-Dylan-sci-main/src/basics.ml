let abs x =
  if x >= 0 then x
  else (-x)

(***********************************)
(* Part 1: Non-Recursive Functions *)
(***********************************)

let rev_tup (tup : 'a * 'b) =
  match tup with
  | (a, b) -> (b, a);;
let rev_triple (tup : 'a * 'b * 'c) =
  match tup with
  | (a, b, c) -> (c, b, a);;

let is_odd x =
  match x mod 2 with 
  | 0 -> false
  | _ -> true;;

let is_older (date1: int * int * int) (date2: int * int * int) =
  match date1, date2 with
  | (year1, month1, day1), (year2, month2, day2) ->
    if year1 < year2 then true
    else if year1 = year2 && month1 < month2 then true
    else if year1 = year2 && month1 = month2 && day1 < day2 then true
    else false;;

let to_us_format (date1: int * int * int) =
  match date1 with
  | (year1, month1, day1) -> (month1, day1, year1);;
(*******************************)
(* Part 2: Recursive Functions *)
(*******************************)

let rec pow x p =
  if p = 0 then 1
  else x * pow x (p - 1);;

let rec fac n =
  if n = 0 || n = 1 then 1
  else n * fac (n - 1);;
(*****************)
(* Part 3: Lists *)
(*****************)

let rec get_nth ((idx:int), (lst: 'a list)) =
  match lst with
  | [] -> failwith "[]"
  | hd :: tl -> 
    if idx = 0 then hd
    else get_nth ((idx - 1), tl);;

let rec larger lst1 lst2 =
  match lst1, lst2 with
  | [], _ -> lst2
  | _, [] -> lst1
  | _ :: tl1, _ :: tl2 -> 
      if List.length tl1 > List.length tl2 then lst1
      else if List.length tl2 > List.length tl1 then lst2 
      else [];;

let rec sum lst1 lst2 =
  match lst1, lst2 with 
  | [], [] -> 0
  | [], hd2 :: tl2 -> hd2 + sum [] tl2
  | hd1 :: tl1, [] -> hd1 + sum tl1 []
  | hd1 :: tl1, hd2 :: tl2 -> hd1 + hd2 + sum tl1 tl2;; 
