module Complex = struct
  type t = float * float

  let zero = (0.0, 0.0)
  let one = (1.0, 0.0)
  let i = (0.0, 1.0) (* not identity, just sqrt -1 *)
  let add (a, b) (c, d) = (a +. c, b +. d)
  let add_inv (a, b) = (-.a, -.b) (* additive invers *)
  let mul (a, b) (c, d) = ((a *. c) -. (b *. d), (a *. d) +. (b *. c))
  let sclr_mul k (a, b) = (k *. a, k *. b)
  let of_pair (a, b) = (a, b)
  let to_string (a, b) = Printf.sprintf "(%.10g + %.10gi)" a b
end
