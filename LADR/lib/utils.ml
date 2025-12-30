(*** Common Utilities ***)


let print_int_list lst =
	List.iter (fun x -> Printf.printf "%d, " x) lst;
	Printf.printf "\n"