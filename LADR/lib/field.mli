module type S = sig
	type t

	(* additive identity *)
	val zero : t

	(* multiplicative identity *)
	val one : t

	(* operators *)
	val add : t -> t -> t
	val sub : t -> t -> t
	val mul : t -> t -> t
	val div : t -> t -> t

	(* inverses *)
	val neg : t -> t
	val inv : t -> t

	(* equality *)
	val equal : t -> t -> bool

	(* approximate epsilon equality *)
	val eequal : ?epsilon:float -> t -> t -> bool

	val to_string : t -> string
end

module Float : S with type t = float
module Complex : S with type t = Complex.t