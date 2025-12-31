open Vector

(* a vector in R^2 can be drawn *)
let r2_draw v2 =
  Graphics.fill_circle
    (int_of_float (RealVector.nth v2 0))
    (int_of_float (RealVector.nth v2 1))
    4

(* a complex number can be drawn with x: real y: imaginary *)
let complex_draw c =
  Graphics.fill_circle
    (Complex.real c |> int_of_float)
    (Complex.img c |> int_of_float)
    4
