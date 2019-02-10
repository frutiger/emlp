(*
Exercise 9.3.3

Write a function that takes as arguments a function f and a value v. The output
of your function should be a function g that acts just like f, but if there are
any binding errors in f, function g should produce the value v.
*)

fun catch(F, v) = fn x => F(x) handle Bind => v;

