(*
Exercise 5.2.4

We can represent a matrix of reals by a list of lists.  Each list on the "main"
list represents one row of the matrix.  It is possible to compute the
determinant of a matrix by pivotal condensation, a technique where we
recursively eliminate the first row and the first column.  The method can be
described as follows.

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

Write a collection of functions that implement the pivotal condensation
algorithm.  Define suitable exceptions to catch errors, including

    1. The case where a = 0 in step (i) and division by a would therefore yield
       infinity in step (ii), and

    2. Cases where the matrix is not originally square.  That is, there are not
       as many rows as columns, or there are unequal-length rows.

Hint: It helps to take this one in easy stages.  Start with a function that
normalizes a row (list) by dividing each element by a given a constant.  Also,
write a function to subtract a multiple of one row from another.  Then, write a
function that takes a list of rows and subtracts from the tail of each row the
product of the head of the row and a given list.  The latter is the heart of
the pivotal condensation process.  The given row is the normalized tail of the
first row.  When we multiply it (as a vector) by the head of a row and then
subtract the result from the tail of the same row (again, thinking of the lists
as vectors), we are performing the basic operation required by the pivotal
condensation algorithm.
*)

open Real;

exception DivZero;

exception NonSquare;

fun normalize(a:real, nil)   = if Real.==(a, 0.0) then raise DivZero else nil
  | normalize(a,      x::xs) = (x/a)::normalize(a, xs);

fun subrow(a:real, nil,   nil)   = nil
  | subrow(a,      x::xs, y::ys) = (x - a*y)::subrow(a, xs, ys)
  | subrow(_,      _,     _)     = raise NonSquare;

fun condense(nil,          ys) = nil
  | condense((x::xs)::xss, ys) = subrow(x, xs, ys)::condense(xss, ys)
  | condense(_,            _)  = raise NonSquare;

fun det((x::nil)::nil) = x
  | det((x::xs)::xss)  = x * det(condense(xss, normalize(x, xs)))
  | det(_)             = raise NonSquare;

