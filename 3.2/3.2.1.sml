(*
Exercise 3.2.1

Write the following recursive functions.

(a) The factorial function that takes an integer n >= 1 and produces the product
of all the integers from 1 up to n.  Your function need not work correctly if
the argument is less than 1. *)
    fun fact(n) = if n = 1 then 1 else n * fact(n - 1); (*

(b) Given an integer i and a list L cycle L i times.  That is, if
      L = [a1, a2, ..., an]
    then the desired result is [ai+1, ai+2,..., an, a1, a2, ..., an].  You may
    use the function cycle defined in Exercise 3.1.1(f). *)

    use "../3.1/3.1.1.sml";
    fun cycle(xs, i) = if i = 0 then xs else cycle(cycleOnce(xs), i-1); (*

(c) Duplicate each element of a list.  That is, given the list [a1, a2, ..., an]
    produce the list [a1, a1, a2, a2, ..., an, an]. *)
    fun duplicate1(xs, xxs) = if xs = nil
                              then xxs
                              else duplicate1(tl(xs), xxs @ [hd(xs), hd(xs)]);
    fun duplicate(xs) = duplicate1(xs, nil); (*

(d) Compute the length of a list. *)
    fun length(xs) = if xs = nil then 0 else 1 + length(tl(xs)); (*

(e) Compute x^i, where x is a real and i is a nonnegative integer.  The function
    takes two parameters, x and i, and need not behave well if i < 0. *)
    fun power1(r, x, i) = if i = 0 then r else power1(x * r, x, i - 1);
    fun power(x, i) = power1(1, x, i); (*

(f) Compute the largest element of list of reals [sic].  Your function need not
    behave well if the list is empty. *)
    fun maxReal2(x : real, y) = if x > y then x else y;
    fun maxRealList1(largest, xs) = if null(xs)
                                    then largest
                                    else maxRealList1(maxReal2(hd(xs), largest), tl(xs));
    fun maxRealList(xs) = maxRealList1(hd(xs), tl(xs));

