(*
Exercise 3.1.2

Write functions to do the following.

(a) Given 3 integers, produce a pair consisting of the smallest and largest. *)
    fun min3(a, b, c) = if b < c then (if a < b then a else b)
                                 else (if a < c then a else c);
    fun max3(a, b, c) = if b > c then (if a > b then a else b)
                                 else (if a > c then a else c);
    fun minmax3(a, b, c) = (min3(a, b, c), max3(a, b, c)); (*

(b) Given 3 integers, produce a list of the three in sorted order. *)
    fun mid3(a, b, c) = if b < c then (if a < b then b
                                                else (if a < c then a else c))
                                 else (if a < c then c
                                                else (if a < b then a else b));
    fun sort3(a, b, c) = [min3(a, b, c), mid3(a, b, c), max3(a, b, c)]; (*

(c) Round a real number to the nearest tenth. *)
    fun roundTenth(x) = real(floor(x * 10.0)) / 10.0; (*

(d) Given a list, return that list with the second element deleted.  Your
    function need not behave well on lists of length shorter than 2. *)
    fun del2(xs) = hd(xs) :: tl(tl(xs));

