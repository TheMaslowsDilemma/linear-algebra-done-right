type t

(*** Constants ***)
val zero : t
val one : t
val i : t

(*** Addition ***)
val add : t -> t -> t
val add_inv : t -> t

(*** Multiplication ***)
val mul : t -> t -> t
val mul_inv : t -> t option
val sclr_mul : float -> t -> t

(*** Helpers ***)
val of_pair : float * float -> t
val to_string : t -> string
