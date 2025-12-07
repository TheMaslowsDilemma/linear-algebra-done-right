(*** Chapter One - Vector Spaces ***)
let exercise_1A_P7 () =
  let open Field.Complex in
  let u = Complex.of_pair (-1. /. 2., sqrt 3.0 /. 2.) in
  let v = mul (mul u u) u in
  Printf.printf "u: %s\nu^3: %s\n\n" (to_string u) (to_string v)


(* i tried to find a counter example... i couldnt *)
let exercise_1C_P6b () =
  let open Field.Complex in
  let a = Complex.of_pair (-1. /. 2., sqrt 3.0 /. 2.) in
  let b = one in
  let k = Complex.of_pair (0.5, -0.5) in
  let aaa = mul (mul a a) a in
  let bbb = mul (mul b b) b in
  let ia = mul k a in
  let ib = mul k b in
  let iaiaia = mul (mul ia ia) ia in
  let ibibib = mul (mul ib ib) ib in
  Printf.printf "a: %s\ta^3: %s\n" (to_string a) (to_string aaa);
  Printf.printf "b: %s\tb^3: %s\n" (to_string b) (to_string bbb);
  Printf.printf "ia: %s\tia^3: %s\n" (to_string ia) (to_string iaiaia);
  Printf.printf "ib: %s\tib^3: %s\n" (to_string ib) (to_string ibibib)



let run () = 
  let () = exercise_1A_P7 () in
  exercise_1C_P6b ()
