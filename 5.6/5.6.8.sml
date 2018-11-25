(*
Exercise 5.6.8

Write the two-argument function simpleMap of Section 5.4.2 in Curried form.
Show that its behavior is exactly the same as that of the one-argument function
map of Fig. 5.21.

simpleMap of Section 5.4.2 is reproduced below.

fun simpleMap(F,nil) = nil
  | simpleMap(F,x::xs) = F(x)::simpleMap(F,xs)

map of Fig. 5.21 is reproduced below.
*)

fun map F =
  let
    fun M nil = nil
      | M(x::xs) = F x :: M xs
  in
    M
  end;

fun simpleMap F nil = nil
  | simpleMap F (x::xs) = (F x)::(simpleMap F xs);

fun eq nil nil     = true
  | eq nil _       = false
  | eq _   nil     = false
  | eq (x::xs) (y::ys) = x=y andalso eq xs ys;

fun double x = x * 2;

val f1 = map       double;
val f2 = simpleMap double;

eq (f1 [1,2,3]) (f2 [1,2,3]);

