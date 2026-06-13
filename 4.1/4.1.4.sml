(*
Exercise 4.1.4

Write a function that, given n, prints 2^n X's using only log2(n) recursive
calls.
*)

fun f 0 c = c
  | f 1 c = c ^ c
  | f n c = let
      val g = f (n div 2)
      val h = f (n mod 2)
    in
      g (g (h c))
    end;

fun printX(n) = (
  print(f n "X");
  print("\n")
);

