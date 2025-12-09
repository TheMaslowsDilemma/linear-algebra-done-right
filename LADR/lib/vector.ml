module type S = sig
  type t
  type scalar

  val zero : int -> t
  val one : int -> t
  val dim : t -> int
  val nth : t -> int -> scalar
  val add : t -> t -> t
  val scale : scalar -> t -> t
  val of_list : scalar list -> t
  val to_string : t -> string
end

module Make (F : Field.S) = struct
  type t = F.t array
  type scalar = F.t

  let zero n = Array.make n F.zero
  let one n = Array.make n F.one
  let nth v n = v.(n)
  let dim a = Array.length a
  let of_list lst = Array.of_list lst

  let add u v =
    if Array.length u <> Array.length v then
      invalid_arg "vectors must be same length";
    Array.map2 F.add u v

  let scale a v = Array.map (F.mul a) v

  let to_string v =
    let elements = Array.map F.to_string v |> Array.to_list in
    "[ " ^ String.concat "; " elements ^ " ]"
end

module RealVector = Make (Field.Float)
module ComplexVector = Make (Field.Complex)
