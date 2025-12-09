(*** Excercises and Experiments with Graphics ***)

(* let exercise_2A_P8 () =
  let open Vector.RealVector in
  let a = of_list [ 3.; 1.; 4. ] in
  let b = of_list [ 2.; -3.; 5. ] in
  Printf.printf "a + b: %s\n" (add a b |> to_string)
*)

let draw_complex_point c =
  Graphics.fill_circle (Complex.real c |> int_of_float) (Complex.img c |> int_of_float) 4


let three_point_render a =
  let open Vector.ComplexVector in
  let v =
    of_list
      [
        Complex.of_pair (0.1, 0.1);
        Complex.of_pair (0.2, 0.2);
        Complex.of_pair (0.05, 0.05);
      ]
  in
  Array.iter draw_complex_point (scale a v)

let rec render_loop (x, y) =
  let open Graphics in
  set_color white; clear_graph ();
  set_color blue;
  three_point_render (Complex.of_pair (float_of_int x, float_of_int y));
  synchronize ();
  Unix.sleepf 0.016;
  if button_down () then raise Exit;
  render_loop (mouse_pos ())

let run () =
  let open Graphics in
  open_graph "";
  set_window_title "Linear Algebra Done Right";
  auto_synchronize false;
  try
    render_loop (Graphics.mouse_pos ())
  with
  | Exit ->
    Graphics.close_graph ();
    Printf.printf "Exiting\n"