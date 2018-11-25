(*
Exercise 5.6.2

Write a definition for the function foldl analogous to the definition of foldr
in Fig. 5.23. Hint: Recompute the initial value in the recursion.

Fig 5.23 is reproduced below.

fun foldr F y nil = y
  | foldr F y (x::xs) = F(x, foldr F y xs);
*)

fun foldl F y nil     = y
  | foldl F y (x::xs) = foldl F (F(y,x)) xs;

