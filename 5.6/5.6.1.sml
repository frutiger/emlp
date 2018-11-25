(*
Exercise 5.6.1

Use the higher-order functions map, foldr, and foldl described in this section
to build the following functions on lists. You should write anonvmous functions
that operate on list elements only.

   (a) A function that turns an integer list into a list of reals with the same
       values. *)

val fnA = map real;

(* (b) A function that turns an integer list L into a list of reals, each of
       which is the absolute value of the element on L. *)

val fnB = map (fn x => real(abs(x)));

(* (c) The function implode, which turns a list of characters into a single
       string with those characters in order. *)

val fnC = foldr (fn (x, y) => str(x) ^ y) "";

(* (d) The function concat, which turns a list of strings into the
       concatenation of all those strings. *)

val fnD = foldr (fn (x, y) => x ^ y) "";

(* (e) A function that turns a list of integers [a1, a2, ..., an] into the
       alternating sum a1 — a2 + a3 — a4 + ... *)

val fnE = foldl (fn (x, y) => x - y) 0;

(* (f) A function that computes the logical AND of a list of booleans. *)

val fnF = foldr (fn (x, y) => x andalso y) true;

(* (g) A function that computes the logical OR of a list of booleans. *)

val fnG = foldr (fn (x, y) => x orelse y) false;

(* (h) A function that computes the exclusive or of a list of booleans. The
       exclusive or of a1, a2, ..., an is true if an odd number of the a's are
       true and false if an even number of the a's are true. *)

val fnH = foldr (fn (x, y) => (not x andalso y) orelse
                              (x andalso not y)) false;

