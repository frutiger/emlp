(*
Exercise 3.1.1

Write functions to compute the following.

(a) The cube of a real number x *)
    fun cube(x : real) = x * x * x; (*

(b) The smallest of the 3 components of a tuple int * int * int *)
    fun smallest(x, y, z) = if y < z then (if x < y then x else y)
                                     else (if x < z then x else z); (*

(c) The third element of a list.  The function need not behave properly if given
    an argument that is a list of length 2 or less. *)
    fun third(xs) = hd(tl(tl(xs))); (*

(d) The reverse of a tuple of length 3 *)
    fun rev3(a, b, c) = (c, b, a); (*

(e) The third character of a character string.  Your function need not behave
    well on strings of length less than 3.  Hint: use 'explode' and your
    function from 3.1.1(c). *)
    fun thirdChar(s) = third(explode(s)); (*

(f) Cycle a list once.  That is, given a list [a1, a2, ..., an] produce the list
    [a2, a3, ..., an, a1]. *)
    fun cycleOnce(xs) = tl(xs) @ [hd(xs)];

