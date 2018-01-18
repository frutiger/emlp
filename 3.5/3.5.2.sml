(*
Exercise 3.5.2

Write a function cycle(L, i) that cycles list L by i positions, as in Exercise
3.2.1(b).  However, your function must take time proportional to the length of L
(which we assume is at least i).  Hint: You need to break this function into a
sequence of steps performed by auxiliary functions.
*)

fun cycle3(nil,       nil,       ys) = ys
  | cycle3(x2r::x2rs, nil,       ys) = cycle3(x2rs, nil,  x2r::ys)
  | cycle3(x2rs,      x1r::x1rs, ys) = cycle3(x2rs, x1rs, x1r::ys)

fun cycle2(nil,     x2rs, x1rs) = cycle3(x2rs, x1rs, nil)
  | cycle2(x2::x2s, x2rs, x1rs) = cycle2(x2s, x2::x2rs, x1rs);

fun cycle1(x2s,    x1rs, 0) = cycle2(x2s, nil,     x1rs)
  | cycle1(x::x2s, x1rs, n) = cycle1(x2s, x::x1rs, n - 1)
  | cycle1(nil,    x1rs, n) = nil;

fun cycle(x1s, n) = cycle1(x1s, nil, n);

