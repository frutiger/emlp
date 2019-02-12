(*
Exercise 4.1.4

Write a function that, given n, prints 2^n X's using only log2(n) recursive
calls.
*)

fun pow2(n) = Real.round(Math.pow(2.0, Real.fromInt(n)));

fun grow(s, factor) = String.translate
                      (fn _ => (String.substring(s, 0, factor)))
                      s;

fun genX(s, 1)      = s
  | genX(s, factor) = if factor div size(s) > 1
                      then genX(grow(s, size(s)), factor div size(s))
                      else grow(s, factor);

fun printX(n) = (
  print(genX("XX", pow2(n-1)));
  print("\n")
);

