open Vector

(*** Excercises and Experiments with Graphics ***)

let exercise_2A_P8 () =
  let open Vector.RealVector in
  let a = of_list [ 3.; 1.; 4. ] in
  let b = of_list [ 2.; -3.; 5. ] in
  Printf.printf "a + b: %s\n" (add a b |> to_string)

let excercise_2C_10 () =
  let m = 10 in
  let px x = pow x k *. (pow (1. -. x) (x -. k)) in
  