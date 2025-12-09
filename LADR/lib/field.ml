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
  val root2 : t -> t

  (* equality *)
  val equal : t -> t -> bool

  (* approximate epsilon equality *)
  val eequal : ?epsilon:float -> t -> t -> bool
  val to_string : t -> string
end

module Float : S with type t = float = struct
  type t = float

  let zero = 0.0
  let one = 1.0
  let add a b = a +. b
  let sub a b = a -. b
  let mul a b = a *. b
  let div a b = a /. b
  let neg a = -.a
  let inv a = 1. /. a
  let root2 a = sqrt a
  let equal a b = a = b
  let eequal ?(epsilon = 1e-9) a b = abs_float (a -. b) < epsilon
  let to_string a = Printf.sprintf "%.10g" a
end

module Complex : S with type t = Complex.t = struct
  type t = Complex.t

  let zero = Complex.zero
  let one = Complex.one
  let add = Complex.add
  let sub = Complex.sub
  let mul = Complex.mul
  let div = Complex.div
  let inv = Complex.inv
  let neg = Complex.neg
  let root2 = Complex.root2
  let equal = Complex.equal
  let eequal = Complex.eequal
  let to_string = Complex.to_string
end
