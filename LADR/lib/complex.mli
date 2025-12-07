type t
type scalar = float

(*** Constants ***)
val zero : t
val one : t
val i : t

(*** Addition ***)
val add : t -> t -> t
val sub : t -> t -> t

(*** Multiplication ***)
val mul : t -> t -> t
val sclr_mul : scalar -> t -> t
val div : t -> t -> t

(*** Inverse ***)
val neg : t -> t
val inv : t -> t

(*** Norm ***)
val norm : t -> scalar

(*** Equalities ***)
val equal : t -> t -> bool
val eequal : ?epsilon:float -> t -> t -> bool

(*** Helpers ***)
val of_pair : scalar * scalar -> t
val to_string : t -> string
