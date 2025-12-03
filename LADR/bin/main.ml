open LADR

(*** Excercise 1A ***)
let p7 =
  let open Complex in
  let u = Complex.of_pair (-1. /. 2., sqrt 3.0 /. 2.) in
  (* (-1 + sqrt 3) / 2 ) *)
  let v = Complex.(mul (mul u u) u) in
  Complex.to_string v

let () = Printf.printf "v = %s\n" p7