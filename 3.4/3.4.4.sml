(*
Exercise 3.4.4

Improve upon the function of Exercise 3.2.1(e) [sic], to compute the maximum of
a list of reals by using a let expression.  Hint: Compute the maximum of the
tail of the list first.

The solution to 3.2.1(f) is reproduced below.

(f) Compute the largest element of list of reals [sic].  Your function need not
    behave well if the list is empty.
    fun maxReal2(x : real, y) = if x > y then x else y;
    fun largestReal1(largest, xs) = if null(xs)
                                    then largest
                                    else largestReal1(maxReal2(hd(xs), largest), tl(xs));
    fun largestReal(xs) = largestReal1(hd(xs), tl(xs));
*)

fun maxStringList(xs : string list) =
  if tl(xs) = nil then hd(xs) else
    let
      val x       = hd(xs)
      val maxTail = maxStringList(tl(xs))
      val max     = if x > maxTail then x else maxTail
    in
      max
    end;

