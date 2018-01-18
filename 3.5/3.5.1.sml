(*
Exercise 3.5.1

Write a function cat(L, M) that produces the concatenation L@M of the lists L
and M However, your function should not use the @ operator; only the cons
operator:: should be used.  Your function must run in time proportional to the
length of L, independent of M.
*)

fun cat2(nil, ys)     = ys
  | cat2(xr::xrs, ys) = cat2(xrs, xr::ys);

fun cat1(xrs, nil,   ys) = cat2(xrs, ys)
  | cat1(xrs, x::xs, ys) = cat1(x::xrs, xs, ys);

fun cat(xs, ys) = cat1(nil, xs, ys);

(*
[1, 2, 3], [7, 8, 9]
[3, 2, 1], [7, 8, 9]
[1, 2, 3, 7, 8, 9]
*)
