open Vector

(*
	Suppose $b, c \in R$. Define T: R^3 -> R^2
	T (x, y, z) = (2x - 4y + 3z + b, 6x + cxyz)
	Show T is linear <=> b, c = 0
*)
let excercise_3A_P1 () =
	let open RealVector in
	let t v b c = 
		let x = 2. *. (nth v 0) -. 4. *. (nth v 1) +. 3. *. (nth v 2) +. b in
		let y = 6. *. (nth v 0) +. c *. (nth v 0) *. (nth v 1) *. (nth v 2) in
		of_list [x; y]
	in
	let t_linear v = t v 0.0 0.0 in	
	let vec1 = of_list [ 1.5; 2.5; 30.0 ] in
	let vec2 = of_list [ 1.5; 2.5; -30.0 ] in
	let tvec1 = t_linear vec1 in
	let tvec2 = t_linear vec2 in
	let sum_tv1_tv2 = add tvec1 tvec2 in
	let sum_v1_v2 = add vec1 vec2 in
	let t_sum_v1_v2 = t_linear sum_v1_v2 in
	Printf.printf "T (%s) + T (%s) = %s\n" (to_string vec1) (to_string vec2) (to_string sum_tv1_tv2);
	Printf.printf "T (%s + %s) = T (%s) = %s\n" (to_string vec1) (to_string vec2) (to_string sum_v1_v2) (to_string t_sum_v1_v2)

let run () = excercise_3A_P1 ()
