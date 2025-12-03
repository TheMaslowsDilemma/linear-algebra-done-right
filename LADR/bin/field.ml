(* this is a float field which will represent R *)
module type Field = struct
	type t = float

	let zero = 0.0
	let one = 1.0

	let add = ( +. )
	let sub = ( -. )
	let add_inv a = zero -. a
	let mul = ( *. )
	let div = ( /. )
	let mul_inv a = one /. a
	let equal a b = a = b

	let to_string a = Printf.sprintf "%.10g" a
end

module FloatField = Float