module Complex : sig
  type t

  val zero : t
  val one : t
  val i : t
  val add : t -> t -> t
  val mul : t -> t -> t
  val adi : t -> t
  val of_pair : float * float -> t
  val to_string : t -> string
end
