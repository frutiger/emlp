(*
Exercise 9.4.7

Using functions tokens or fields from the structure String, write a function
that breaks a string into tokens separated by:

a) One or more white-space characters.
*)

val tokenizeOnWhitespace = String.tokens (Char.contains " \t\n");

(*
b) Single slashes (/), as are used to separate elements of a path name in UNIX.
*)

val tokenizePathname = String.tokens (fn x => x = #"/");

