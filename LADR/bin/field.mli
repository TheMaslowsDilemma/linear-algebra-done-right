module FIELD : sig
	type t

	val zero : t	(* add identity *)
	val one : t		(* mul identity *)

	val add : t -> t -> t
	val sub : t -> t -> t
	val add_inv : t -> t
	val mul : t -> t -> t
	val div : t -> t -> t
	val mul_inv : t -> t -> t
	val equal : t -> t -> bool
	val to_string : t -> string
end