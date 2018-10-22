(*
Exercise 5.5.1

Write, in Curried form, a function applyList that takes a list of functions and
a value and applies each function to the value, producing a list of the
results.
*)

fun applyList nil     x = nil
  | applyList (F::FS) x = F x::applyList FS x;

