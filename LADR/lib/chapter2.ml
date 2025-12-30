(*** Excercises ***)

(* integer range utility *)
let ( -- ) a b =
  let rec aux n acc =
    if n < a then acc else aux (n - 1) (n :: acc)
  in aux b []

(* pascals triangle utility : maybe not so efficient *)
let pascals_triangle row =
  let rec conv acc =
    match acc with
    | [] -> []
    | a :: [] -> [a]
    | a :: b :: rest -> (a + b) :: (conv (b :: rest))
  in
  let rec aux n acc =
    if n == 0 then acc else aux (n - 1) ( 1 :: (conv acc))
  in
  if row < 1 then [] else aux (row - 1) [1]
;;

(* let exercise_2A_P8 () =
  let open Vector.RealVector in
  let a = of_list [ 3.; 1.; 4. ] in
  let b = of_list [ 2.; -3.; 5. ] in
  Printf.printf "a + b: %s\n" (add a b |> to_string)
 *)

(* side note: this looks like the binomial distribution 
   we want to show we can build x^i with 0 <= i <= m
   from a linear combo of the pk functions. since this
   shows they span P_m (F).
   we can build this backwards easily through induction
   starting from x^m
*)

(* let excercise_2C_10 () =
  let m = 10 in
  let pk k x = pow x k *. (pow (1. -. x) (x -. k)) in
  let ps = List.map (fun k -> pk k) (0 -- m) in
 *)

let run () = 
  let pascals5 = pascals_triangle 30 in
  Utils.print_int_list pascals5
