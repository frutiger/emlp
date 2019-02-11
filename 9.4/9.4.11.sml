(*
Exercise 9.4.11

Using functions from the structure Array, write functions to do the following:

a) Produce an array of 26 elements initialized to the characters #"a" through
   #"z".
*)

fun alphabet() = let
  val result = Array.array(26, #" ");
in (
  Array.modifyi (fn (i, _) => chr(ord(#"a") + i)) result;
  result
) end;

(*
b) Find the largest element of an integer array.
*)

fun largest(array) = Array.foldl Int.max (Array.sub(array, 0)) array;

