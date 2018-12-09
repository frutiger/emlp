(*
Exercise 6.1.1

Give type definitions (abbreviations) for the following types.

a) A set of sets, where the type of elements is unspecified and sets are
   represented by lists.
*)
type 'a setSet = 'a list list;

(*
b) A list of triples, the first two components of which have the same type and
   the third component of which is of some (possibly) different type.
*)
type ('a, 'b) tripleList = ('a * 'a * 'b) list;

