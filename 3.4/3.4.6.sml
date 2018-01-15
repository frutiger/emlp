(*
Exercise 3.4.6

Write a version of sumPairs of Example 3.18 that sums each component of the
pairs separately, returning a pair consisting of the sum of the first components
and the sum of the second components.

For reference, Example 3.18 is reproduced below.

    fun sumPairs(nil)        = 0
      | sumPairs((x, y)::zs) = x + y + sumPairs(zs);
*)

fun sumPairs(nil)          = (0, 0)
  | sumPairs((x1, x2)::xs) =
  let
    val (x1s, x2s) = sumPairs(xs)
  in
    (x1 + x1s, x2 + x2s)
  end;

