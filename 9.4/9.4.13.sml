(*
Exercise 9.4.13

Write a function that operates on vectors, performing the analog of the function
Substring.getc on substrings. Then, use your function to write another function
that finds the maximum element in an integer vector.
*)

fun geti1(slice) = if VectorSlice.length(slice) = 0
                   then NONE
                   else SOME (VectorSlice.sub(slice, 0),
                              VectorSlice.subslice(slice, 1, NONE));

fun geti(vector) = geti1(VectorSlice.slice(vector, 0, NONE));

