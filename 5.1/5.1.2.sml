(*
Exercise 5.1.2

Write the following functions as values using fn and a match.

(a) Function padd of Fig. 3.27.

Function padd of Fig. 3.27 is reproduced below.

fun padd(P,            nil)   = P
  | padd(nil,          Q)     = Q
  | padd((p:real)::ps, q::qs) = (p + q)::padd(ps, qs);
*)
val rec padd =
  fn (P,   nil)            => P
   | (nil, Q)              => Q
   | ((p:real)::ps, q::qs) => (p + q)::padd(ps, qs);
(*
(b) Function smult of Fig. 3.27.

Function smult of Fig. 3.27 is reproduced below.

fun smult(nil,          q) = nil
  | smult((p:real)::ps, q) = (p*q)::smult(ps, q);
*)
val rec smult =
  fn (nil,          q) => nil
   | ((p:real)::ps, q) => (p*q)::smult(ps, q);
(*
(c) Function pmult of Fig. 3.27

Function pmult of Fig. 3.27 is reproduced below.

fun pmult(P, nil)   = nil
  | pmult(P, q::qs) = padd(smult(P, q), 0.0::pmult(P, qs));
*)
val rec pmult =
  fn (P, nil)   => nil
   | (P, q::qs) => padd(smult(P, q), 0.0::pmult(P, qs));
(*
(d) Function sumPairs of Example 3.18.

Function sumPairs of Example 3.18 is reproduced below.

fun sumPairs(nil)       = 0.0
  | sumPairs((x,y)::zs) = x + y + sumPairs(zs);
*)

val rec sumPairs =
  fn nil        => 0
   | (x, y)::zs => x + y + sumPairs(zs);
(*
(e) Function printList of Example 4.3.

Function printList of Example 4.3 is reproduced below.

open TextIO;

fun printList(nil)   = ()
  | printList(x::xs) = (
      print(Int.toString(x));
      print("\n");
      printList(xs)
    );
*)
val rec printList =
  fn nil => ()
   | x::xs => (
       print(Int.toString(x));
       print("\n");
       printList(xs)
     );
(*
(f) Function merge of Fig 3.12.

Function merge of Fig 3.12 is reproduced below.

fun merge(nil,        M)          = M
  | merge(L,          nil)        = L
  | merge(L as x::xs, M as y::ys) = if   x < y
                                    then x::merge(xs, M)
                                    else y::merge(L, ys);
*)
val rec merge =
  fn (nil,        M)          => M
   | (L,          nil)        => L
   | (L as x::xs, M as y::ys) => if   x < y
                                 then x::merge(xs, M)
                                 else y::merge(L, ys);
(*
(g) Function comb of Fig. 3.13.

Function comb of Fig. 3.13 is reproduced below.

fun comb(_, 0) = 1
  | comb(n, m) = if   m=n
                 then 1
                 else comb(n-1, m) + comb(n-1, m-1);
*)
val rec comb =
  fn (_, 0) => 1
   | (n, m) => if   m=n
               then 1
               else comb(n-1, m) + comb(n-1, m-1);
