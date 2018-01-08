(*
Exercise 3.3.1

Write the following functions from previous exercises, using two or more
patterns in each.

(a) The factorial function of Exercise 3.2.1(a). *)
    fun fact(1) = 1
      | fact(n) = n * fact(n - 1); (*

(b) The function from Exercise 3.1.1(f) that cycles a list one position.  If the
    list is empty, return the empty list. *)
    fun cycleOnce(nil)   = nil
      | cycleOnce(x::xs) = xs @ [x]; (*

(c) The function from Exercise 3.2.1(b) that cycles a list i times, where i, as
    well as the list, is a parameter. *)
    fun cycle(xs,    0) = xs
      | cycle(nil,   i) = nil
      | cycle(x::xs, i) = cycle(xs @ [x], i - 1); (*

(d) The function from Exercise 3.2.1(c) that duplicates each element of a
    list. *)
    fun duplicate(nil)   = nil
      | duplicate(x::xs) = [x, x] @ duplicate(xs); (*

(e) The function from Exercise 3.2.1(d) that computes x^i. *)
    fun power1(r, x, 0) = r
      | power1(r, x, i) = power1(x * r, x, i - 1);
    fun power(x, i) = power1(1, x, i); (*

(f) The function of Exercise 3.2.1(e) that computes the largest of a list of
     reals [Note: using string since reals are not comparable].  *)
    fun max2String(x : string, y) = if x > y then x else y;
    fun largestString(nil)        = ""
      | largestString(x1::nil)    = x1
      | largestString(x1::x2::xs) = largestString(max2String(x1, x2)::xs);

