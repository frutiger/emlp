(*
Exercise 7.5.3

Add to the triangularization code of Figs. 7.11 and 7.13 to make a complete
Gaussian elimination algorithm.

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
The code from Fig. 7.13 is reproduced below, rewritten in terms of the functions
from Exercise 7.5.4 below.  Note: the range of k has been modified to range over
the width of the matrix to allow for non-square matrices.
*)

i := 0;
while !i < Array.length(M) - 1 do (
  j := !i + 1;
  while !j < Array.length(M) do
    let
      val ratio = get(M, !j, !i)/get(M, !i, !i)
      val k     = ref (!i + 1)
    in
      set(M, !j, !i, 0.0);
      while !k < Array.length(Array.sub(M, 0)) do (
        set(M, !j, !k, get(M, !j, !k) - ratio * get(M, !i, !k));
        k := !k + 1
      );
      j := !j + 1
    end;
  i := !i + 1
);

(*
We now proceed with the solution to Exercise 7.5.3.
*)

j := Array.length(M) - 1;
while !j >= 0 do (
  i := !j - 1;
  while !i >= 0 do (
    let
      val ratio = get(M, !i, !j) / get(M, !j, !j);
      val k = ref 0
    in
      while !k < Array.length(Array.sub(M, 0)) do (
        set(M, !i, !k, get(M, !i, !k) - get(M, !j, !k) * ratio);
        k := !k + 1
      )
    end;
    i := !i - 1
  );
  j := !j - 1
);

