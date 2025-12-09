module type S = sig
  type t

  val zero : int -> t
  val one : int -> t
  val dim : t -> int
end

module Make (F : Field.S) = struct
  type t = F.t array

  let zero n = Array.make n F.zero
  let one n = Array.make n F.one
  let dim a = Array.length a

  let add u v =
    if Array.length u <> Array.length v then
      invalid_arg "vectors must be same length";
    Array.map2 F.add u v
end
