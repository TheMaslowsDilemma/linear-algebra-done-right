open Vector

(*** Excercises and Experiments with Graphics ***)

(* let exercise_2A_P8 () =
  let open Vector.RealVector in
  let a = of_list [ 3.; 1.; 4. ] in
  let b = of_list [ 2.; -3.; 5. ] in
  Printf.printf "a + b: %s\n" (add a b |> to_string)
*)
(* a vector in R^2 can be drawn *)
let r2_draw v2 = 
  Graphics.fill_circle (int_of_float (RealVector.nth v2 0)) (int_of_float (RealVector.nth v2 1)) 4

(* a complex number can be drawn with x: real y: imaginary *)
let complex_draw c =
  Graphics.fill_circle (Complex.real c |> int_of_float) (Complex.img c |> int_of_float) 4

let three_r2_point_render () =
  let open RealVector in
  let vs = [
    of_list [ 100.; 30. ];
    of_list [ 20.; 400. ];
    of_list [ 400.; 400. ]
    ]
  in
  List.iter r2_draw vs

let three_complex_point_render a =
  let open ComplexVector in
  let v =
    of_list
      [
        Complex.of_pair (0.1, 0.1);
        Complex.of_pair (0.2, 0.2);
        Complex.of_pair (0.05, 0.05);
      ]
  in
  Array.iter complex_draw (scale a v)

let rec render_loop_complex (x, y) =
  let open Graphics in
  set_color white; clear_graph ();
  set_color blue;
  three_complex_point_render (Complex.of_pair (float_of_int x, float_of_int y));
  synchronize ();
  Unix.sleepf 0.016;
  if button_down () then raise Exit;
  render_loop_complex (mouse_pos ())

let rec render_loop_real () =
  let open Graphics in
  set_color white; clear_graph ();
  set_color blue;
  three_r2_point_render ();
  synchronize ();
  Unix.sleepf 0.016;
  if button_down () then raise Exit;
  render_loop_real ()

let run () =
  let open Graphics in
  open_graph "";
  set_window_title "Linear Algebra Done Right";
  auto_synchronize false;
  try
    render_loop_real ()
  with
  | Exit ->
    Graphics.close_graph ();
    Printf.printf "Exiting\n"