(*
Exercise 5.5.2

Write, in Curried form, a function makeFnList that takes a function F whose
domain type is D and whose range type R is a function type T1 -> T2. The result
of makeFnList is a function G that takes a list of elements [d1, d2, ..., dn]
of type D and produces a list of functions [f1, f2, ..., fn] of type R, such
that fi = F(di).
*)

fun makeFnList F =
  let
    val rec wrapper = fn nil     => nil
                       | (d::ds) => F d::wrapper ds
  in
    wrapper
  end;

