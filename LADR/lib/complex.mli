module Complex : sig
  type t

  val zero : t
  val one : t
  val i : t
  val add : t -> t -> t
  val add_inv : t -> t
  val mul : t -> t -> t
  val sclr_mul : float -> t -> t
  val of_pair : float * float -> t
  val to_string : t -> string
end
