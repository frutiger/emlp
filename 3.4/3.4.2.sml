(*
Exercise 3.4.2

Rewrite Fig. 3.22 so line (4) does not use a pattern in the val-declaration.
That is, replace line (4) by val x = split(cs), and obtain the components of
pair x as needed.

Fig 3.22 is reproduced below.

(1) fun split(nil)      = (nil, nil)
(2)   | split([a])      = (a,   nil)
(3)   | split(a::b::cs) =
        let
(4)       val (M, N) = split(cs)
        in
(5)       (a::M, b::N)
        end;
*)

fun split(nil)      = (nil, nil)
  | split([a])      = ([a], nil)
  | split(a::b::cs) =
    let
      val x = split(cs)
    in
      (a::(#1 x), b::(#2 x))
    end;

