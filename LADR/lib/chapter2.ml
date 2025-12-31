(*** Excercises ***)

(* integer range utility *)
let ( -- ) a b =
  let rec aux n acc = if n < a then acc else aux (n -. 1.) (n :: acc) in
  aux b []

(* returns the upto row : maybe not so efficient
      1
     1 1
    1 2 1
   1 3 3 1
  1 4 6 4 1
 *)
let pascals_triangle row =
  let rec conv acc =
    match acc with
    | [] -> []
    | a :: [] -> [ a ]
    | a :: b :: rest -> (a +. b) :: conv (b :: rest)
  in
  let next_row prev = 1. :: conv prev in
  let rec aux n acc =
    if n == 0 then acc
    else
      let previous = List.hd acc in
      let current = next_row previous in
      aux (n - 1) (current :: acc)
  in
  if row < 1 then [] else aux (row - 1) [ [ 1. ] ]


let exercise_2A_P8 () =
  let open Vector.RealVector in
  let a = of_list [ 3.; 1.; 4. ] in
  let b = of_list [ 2.; -3.; 5. ] in
  Printf.printf "a + b: %s\n" (add a b |> to_string)


(* side note: this looks like the binomial distribution 
   we want to show we can build x^i with 0 <= i <= m
   from a linear combo of the pk functions. since this
   shows they span P_m (F).
   we can build this backwards easily through induction
   starting from x^m
*)

let excercise_2C_10 base power =
  let m = 4. in
  let pk k x = (x ** k) *. ((1. -. x) ** (m -. k)) in

  (* we prove here that any x^i can be formed lin. comb.
     of pk
  *)
  let pow_i i x =
    let triangle_i = List.rev (pascals_triangle (int_of_float m - i + 1)) in
    let p_fxs = List.map (fun kk -> pk kk) (0. -- m) in
    (* sums the function list `tosum` by adding and subtracting elements.
       ex. alternating_sum [a, b, c, d] 1.0  => a - b + c - d
       ex. alternating_sum [a, b, c, d, e] -1.0  => a + b - c + d - e *)
    let alternating_sum tosum sign =
      let rec altsum_aux acc fxs s =
        match fxs with
        | [] -> acc
        | f :: rest ->
            altsum_aux (fun xx -> acc xx +. (f xx *. s)) rest (s *. -1.0)
      in
      let zero_fun _ = 0.0 in
      altsum_aux zero_fun tosum sign
    in
    let rec aux triangle_rows fxs acc =
      match (triangle_rows, fxs) with
      | [], _ -> List.hd acc
      | _, [] -> List.hd acc
      | row :: tri_rst, pfx :: fxs_rst ->
          let pow_n =
            let mapping_fx a f =
             fun x ->
              let fx = f x in
              fx *. a
            in
            let linear_functions = List.map2 mapping_fx row (pfx :: acc) in
            alternating_sum linear_functions (-1.0)
          in
          aux tri_rst fxs_rst (pow_n :: acc)
    in
    (aux triangle_i (List.rev p_fxs) []) x
  in
  Printf.printf "pow(%f, %d) = %f\n" base power (pow_i power base)

let run () = excercise_2C_10 6.0 3
