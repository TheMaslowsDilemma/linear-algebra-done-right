(* let exercise_2A_P8 () =
  let open Vector.RealVector in
  let a = of_list [ 3.; 1.; 4. ] in
  let b = of_list [ 2.; -3.; 5. ] in
  Printf.printf "a + b: %s\n" (add a b |> to_string) *)

let draw_complex_point c =
  Graphics.set_color Graphics.blue;
  Graphics.fill_circle (Complex.real c |> int_of_float) (Complex.img c |> int_of_float) 10

let exercise_2A_P8 () =
  let open Vector.ComplexVector in
  let a = Complex.of_pair (5., -1.5) in
  let b =
    of_list
      [
        Complex.of_pair (100., 100.);
        Complex.of_pair (50., 20.);
        Complex.of_pair (40., 100.);
      ]
  in
  Array.map draw_complex_point (scale a b)

let run () = exercise_2A_P8 ()
