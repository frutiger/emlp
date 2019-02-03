(*
Exercise 7.5.1

In Exercise 5.2.4 we discussed the pivotal condensation method of taking the
determinant of a matrix, and we asked for a list-based solution.  We can use
references and arrays to give a solution that follows more closely the
description of the algorithm given informally in Exercise 5.2.4. Write this
function.

For reference, the pivotal condensation algorithm is reproduced below.

BASIS: If there is one row and column, then return the one element.

INDUCTION: If there are more than one row and column,

    i. Normalize the first row by dividing each element by the first element,
       say a, in the row.

   ii. For each element M_ij not in the first row or column, subtract from M_ij
       the product of the first element in row i and the jth element in row 1.
       These are the elements furthest above, and furthest to the left of M_ij.

  iii. Recursively compute the determinant of the matrix formed by eliminating
       the first row and first column.  The result is a times this determinant.
       Recall a is the constant from step (i) that was originally in the upper
       left corner of the matrix.
*)

fun get(M, i, j) = Array.sub(Array.sub(M, i), j);

fun set(M, i, j, x) = Array.update(Array.sub(M, i), j, x);

fun normalize(M, x) =
  let
    val i = ref x;
    val a = get(M, x, x)
  in
    while !i < Array.length(M)
    do (
      set(M, x, !i, get(M, x, !i)/a);
      i := !i + 1
    )
  end;

fun condense(M:real array array, x) =
  let
    val i = ref (x+1);
    val j = ref (x+1)
  in
    while !i < Array.length(M)
    do (
      while !j < Array.length(M)
      do (
        set(M, !i, !j, get(M, !i, !j) - (get(M, !i, x) * get(M, x, !j)));
        j := !j + 1
      );
      i := !i + 1;
      j := x + 1
    )
  end;

fun det1(M:real array array, x) =
  let
    val a = get(M, x, x)
  in
    if x = Array.length(M) - 1
    then a
    else (
      normalize(M, x);
      condense(M, x);
      a * det1(M, x + 1)
    )
  end;

fun det(M) = det1(M, 0);

