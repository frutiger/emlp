(*
Exercise 9.2.6

Write a function addToRef(r, x) that adds x to ref r, returning the unit

a) Using ignore.
*)

fun addToRefA(r, x) = ignore (!r + x);

(*
b) Using before.
*)

fun addToRefB(r, x) = () before (!r + x; ());

(*
c) Using neither ignore nor before.
*)

fun addToRefC(r, x) = (!r + x; ());

