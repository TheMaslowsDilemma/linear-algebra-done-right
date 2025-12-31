(*** Common Utilities ***)

let print_int_list lst =
  List.iter (fun x -> Printf.printf "%d, " x) lst;
  Printf.printf "\n"

let print_float_list lst =
  List.iter (fun x -> Printf.printf "%f, " x) lst;
  Printf.printf "\n"

let print_int_list_list lst =
  Printf.printf "[\n";
  List.iter
    (fun x ->
      Printf.printf "\t";
      print_int_list x)
    lst;
  Printf.printf "]\n"

let print_float_list_list lst =
  Printf.printf "[\n";
  List.iter
    (fun x ->
      Printf.printf "\t";
      print_float_list x)
    lst;
  Printf.printf "]\n"

let list_last lst = List.hd (List.rev lst)
