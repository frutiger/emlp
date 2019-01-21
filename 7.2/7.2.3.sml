(*
Exercise 7.2.3

Write functions to perform the following tasks:
a) Cycle an array A of length n by one position.
*)

fun cycleOne1(destination, source, length, index, remaining) =
  if remaining = 0
  then ()
  else (
    Array.update(destination, (index+1) mod length, Array.sub(source, index));
    cycleOne1(destination, source, length, index+1, remaining-1)
  );

fun cycleOne(array) =
  let
    val length = Array.length(array);
    val result = Array.array(length, Array.sub(array, 0))
  in (
    cycleOne1(result, array, length, 0, length);
    result
  ) end;

(*
b) Create a list of the elements of an array A of length n, in order, starting
at position 0.
*)

fun genArray1(array, index, remaining) =
  if remaining = 0
  then ()
  else (
    Array.update(array, index, index);
    genArray1(array, index+1, remaining-1)
  );

fun genArray(size) =
  let
    val result = Array.array(size, 0)
  in (
    genArray1(result, 0, size);
    result
  ) end;

(*
c) Reverse an array A of length n.
*)

fun swap(array, i1, i2) =
  let
    val temp = Array.sub(array, i2)
  in (
    Array.update(array, i2, Array.sub(array, i1));
    Array.update(array, i1, temp)
  ) end;

fun reverse1(array, index, length, remaining) =
  if remaining = 0
  then ()
  else (
    swap(array, index, length-index-1);
    reverse1(array, index+1, length, remaining-1)
  );

fun reverse(array) =
  let
    val length = Array.length(array);
  in (
    reverse1(array, 0, length, length div 2);
    array
  ) end;

(*
d) Given a function f and an integer n, create a function g that applies f to
each element of an array of length n. Function g returns an array of the
n results.
*)

fun applyFunc(f, destination, source, index, remaining) =
  if remaining = 0
  then ()
  else (
    Array.update(destination, index, f(Array.sub(source, index)));
    applyFunc(f, destination, source, index+1, remaining-1)
  );

fun arrayMap(f, n) =
  fn array => let
    val result = Array.array(n, Array.sub(array, 0))
  in (
    applyFunc(f, result, array, 0, n);
    result
  ) end;

