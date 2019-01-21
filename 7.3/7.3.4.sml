(*
Exercise 7.3.4

Early versions of ML had operators inc i and dec i that would increment and
decrement by 1 the value referred to by a variable i of type int ref. Write
functions inc and dec that have the desired effect.
*)

fun inc i = i := !i + 1;

fun dec i = i := !i - 1;

