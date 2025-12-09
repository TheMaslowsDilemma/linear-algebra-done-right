open LADR
open Graphics

let () =
  open_graph "";
  set_window_title "Linear Algebra Done Right";
  synchronize ();
  set_color white;
  clear_graph ();
  set_color black;
  let _ = Chapter2.run () in
  ignore (read_key ());
  close_graph ();