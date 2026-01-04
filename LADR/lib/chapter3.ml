open Vector

(*
	Suppose $b, c \in R$. Define T: R^3 -> R^2
	T (x, y, z) = (2x - 4y + 3z + b, 6x + cxyz)
	Show T is linear <=> b, c = 0

	suppose T is linear
	b must be zero, by the lemma 'a linear map
	sends zero to zero'
	c must be zero, because T(v + u) = T(v) + T(u)
*)
let excercise_3A_P1 () =
	let open RealVector in
	let t v b c = 
		let x = 2. *. (nth v 0) -. 4. *. (nth v 1) +. 3. *. (nth v 2) +. b in
		let y = 6. *. (nth v 0) +. c *. (nth v 0) *. (nth v 1) *. (nth v 2) in
		of_list [x; y]
	in
	let t_linear v = t v 0.0 0.0 in	
	let v1 = of_list [ 1.5; 2.5; 30.0 ] in
	let v2 = of_list [ 1.5; 2.5; -30.0 ] in
	let t_v1 = t_linear v1 in
	let t_v2 = t_linear v2 in
	let sum_tv1_tv2 = add t_v1 t_v2 in
	let sum_v1_v2 = add v1 v2 in
	let t_sum_v1_v2 = t_linear sum_v1_v2 in
	Printf.printf "T (%s) + T (%s) = %s\n" (to_string v1) (to_string v2) (to_string sum_tv1_tv2);
	Printf.printf "T (%s + %s) = T (%s) = %s\n\n" (to_string v1) (to_string v2) (to_string sum_v1_v2) (to_string t_sum_v1_v2)

(*
	we define a homogeneous function that is not linear
	i.e p : R2 -> R s.t. ap (t) = p (at) where a in R
	but p(t + v) != p(t) + p(v)
	this can be found by first starting with the 1 / (x^2 + y^2)
	then realizing we still need a multiple of a we add
	xxx, xxy, xyy, or yyy on the top to cancel out the a^2 on the bottom
*)
let excercise_3A_P8 () =
	let open RealVector in
	let rho v = 
		let x = (nth v 0) ** 2.0 *. (nth v 1) /. ( (nth v 0) ** 2.0 +. (nth v 1) ** 2.0) in
		of_list [ x ]
	in
	let v1 = of_list [ 1.0; 30.0 ] in
	let v2 = of_list [ 4.0; 8.0 ] in
	let rho_v1 = rho v1 in
	let rho_v2 = rho v2 in
	let c = 3.0 in
	(* example of homogeneity working *)
	let cv1 = scale c v1 in
	let rho_cv1 = rho cv1 in
	let c_rhov1 = scale c rho_v1 in
	Printf.printf "T(%.2f %s) = T(%s) = %s\n" c (to_string v1) (to_string cv1) (to_string rho_cv1);
	Printf.printf "%.2f T(%s) = %.2f %s = %s\n\n" c (to_string v1) c (to_string rho_v1) (to_string c_rhov1);
	(* example of additivity not working *)
	let sum_v1_v2 = add v1 v2 in
	let rho_sum_v1v2 = rho sum_v1_v2 in
	let sum_rhov1_rhov2 = add rho_v1 rho_v2 in
	Printf.printf "T(%s + %s) = T(%s) = %s \n" (to_string v1) (to_string v2) (to_string sum_v1_v2) (to_string rho_sum_v1v2);
	Printf.printf "T(%s) + T(%s) = %s + %s = %s\n\n" (to_string v1) (to_string v2) (to_string rho_v1) (to_string rho_v2) (to_string sum_rhov1_rhov2)
	




let run () = 
	let () = excercise_3A_P1 () in
	excercise_3A_P8 ()
