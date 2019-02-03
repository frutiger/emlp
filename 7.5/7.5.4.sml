(*
Exercise 7.5.4

Write the following functions that implement n x m matrices of reals:

a) matrix(n,m,v) returns an n x m matrix with each element initially v.
*)

fun matrix(n, m, v) =
  let
    val i      = ref 1;
    val row    = ref (Array.array(m, v));
    val result = Array.array(n, !row)
  in (
    while !i < n
    do (
      Array.update(result, !i, !row);
      i := !i + 1
    );
    result
  ) end;

(*
b) matrixSub(M, i, j) returns the element in row i and column j of the
matrix M.
*)

fun matrixSub(M, i, j) = Array.sub(Array.sub(M, i), j);

(*
c) matrixUpdate(M, i, j ,v) changes the element in row i and column j of
matrix M to be v.
*)

fun matrixUpdate(M, i, j, v) = Array.update(Array.sub(M, i), j, v);

