(*
Exercise 3.3.14

Write a function that, given list of reals [a1, a2, ..., an], computes

    Π_(i<j) (ai - aj)

That is, we compute the product of all the differences between elements, with
the element appearing later on the list subtracted from the element appearing
first.  If there are no pairs, the product is 1.0.  Hint: Start by writing an
auxiliary function that, given a and [b1, b2, ..., bn], computes
Π_(i=1)^n (a - bi).
*)

fun diff_prods1(x, y::ys) = (x - y) * diff_prods1(x, ys)
  | diff_prods1(x, nil)   = 1.0;

fun diff_prods(x::xs) = diff_prods1(x, xs) * diff_prods(xs)
  | diff_prods(nil)   = 1.0;

