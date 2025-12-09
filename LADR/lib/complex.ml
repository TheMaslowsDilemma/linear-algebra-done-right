type t = float * float
type scalar = float

let zero = (0.0, 0.0)
let one = (1.0, 0.0)
let i = (0.0, 1.0)
let real (a, _) = a
let img (_, b) = b
let add (a, b) (c, d) = (a +. c, b +. d)
let sub (a, b) (c, d) = (a -. c, b -. d)
let neg (a, b) = (-.a, -.b)

let inv (a, b) =
  let y = -.b /. ((a *. a) +. (b *. b)) in
  let x = (1. +. (b *. y)) /. a in
  (x, y)

let root2 (x, y) =
  let b_squared = (-.x +. sqrt ((x *. x) +. (y *. y))) /. 2. in
  let a_squared = x +. b_squared in
  (sqrt a_squared, sqrt b_squared)

let mul (a, b) (c, d) = ((a *. c) -. (b *. d), (a *. d) +. (b *. c))
let sclr_mul k (a, b) = (k *. a, k *. b)
let div a b = inv b |> mul a
let norm (a, b) = sqrt ((a *. a) +. (b *. b))
let equal (a, b) (c, d) = a = c && b = d
let eequal ?(epsilon = 1e-9) a b = norm (sub a b) < epsilon
let of_pair (a, b) = (a, b)
let to_string (a, b) = Printf.sprintf "(%.10g + %.10gi)" a b
