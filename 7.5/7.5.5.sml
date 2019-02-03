(*
Exercise 7.5.5

An improved version of the upper-triangularization algorithm given in this
chapter allows rows to be interchanged in order to avoid division by 0 and to
minimize roundoff errors. In particular, when it is time to zero column i below
the main diagonal, we pick that row among rows i and greater such that the
element in the ith column has as large a magnitude as possible.  Thus, if any
row is nonzero in column i we shall avoid a division by 0 when we compute ratio
as in line (20) of Fig. 7.13. Also, since ratio is as small as possible, we tend
to subtract small numbers from the elements of the matrix, often avoiding large
roundoff errors. As an exercise, write this improved version of the
triangularization algorithm.

The code from Fig. 7.11 is rewritten along with and in terms of the functions
from Exercise 7.5.4 below.
*)

fun matrix(n, m, v) =
  let
    val i      = ref 1;
    val result = Array.array(n, Array.array(m, v))
  in (
    while !i < n
    do (
      Array.update(result, !i, Array.array(m, v));
      i := !i + 1
    );
    result
  ) end;

fun get(M, i, j) = Array.sub(Array.sub(M, i), j);

fun set(M, i, j, v) = Array.update(Array.sub(M, i), j, v);

val n = 10;
val M = matrix(n, n, 0.0);

(* initialize M to be a particular matrix *)

val i = ref 0;
val j = ref 0;
while !i < Array.length(M) do (
  while !j < Array.length(M) do (
    set(M, !i, !j, 1.0 / real(!i + !j + 1));
    j := !j + 1
  );
  j := 0;
  i := !i + 1
);

(*
The solution to Exercise 7.5.5 is provided below by adapting the code from Fig.
7.13, and rewriting it in terms of the functions from Exercise 7.5.4.  Note: the
range of k has been modified to range over the width of the matrix to allow for
non-square matrices.  We will use the sort functions from the solutions to
Exercise 7.2.2.

In pseudocode, the algorithm is modified from

For each row i:
    For each row j greater than i:
        r := M_ji/M_ii
        For each column k:
            M_jk := M_jk - M_ik * r

to

For each row i:
    sort(M_j) where j>i by M_ji
    For each row j greater than i:
        r := M_ji/M_ii
        For each column k:
            M_jk := M_jk - M_ik * r
*)

use "7.2/7.2.2.sml";

i := 0;
while !i < Array.length(M) - 1 do (
  j := !i + 1;
  bubbleSortPass(fn (x, y) => Array.sub(x, !i) > Array.sub(y, !i), M, !j);
  while !j < Array.length(M) do
    let
      val ratio = get(M, !j, !i)/get(M, !i, !i)
      val k     = ref (0)
    in
      (*set(M, !j, !i, 0.0);*)
      while !k < Array.length(Array.sub(M, 0)) do (
        set(M, !j, !k, get(M, !j, !k) - ratio * get(M, !i, !k));
        k := !k + 1
      );
      j := !j + 1
    end;
  i := !i + 1
);

