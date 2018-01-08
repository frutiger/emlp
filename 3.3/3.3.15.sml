(*
Exercise 3.3.15

Write a function to tell whether a list is empty.  That is, return true if and
only if the argument is an empty list.
*)

fun is_list_empty(nil) = true
  | is_list_empty(x)   = false;

