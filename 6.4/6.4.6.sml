(*
Exercise 6.4.6

The published solution to Exercise 6.4.4(a) does not run in time proportional to
the number of nodes in the tree. Use the "difference-list" trick to write a
function (plus auxiliaries) that does not use higher-order functions but is
linear-time.

The published solution to 6.4.4(a) follows.

fun listTreeR(Node(a, nil))   = [a]
  | listTreeR(Node(a, t::ts)) = a :: listTreeR(t) @
                                (tl(listTreeR(Node(a, ts))));

The definition of a general rooted tree is provided below.
*)
datatype ('a) tree = Node of 'a * 'a tree list;

fun listTreeR1(Node(a, nil),   L) = a::L
  | listTreeR1(Node(a, t::ts), L) = a::listTreeR1(t,
                                                  tl(listTreeR1(Node(a, ts),
                                                                L)));

fun listTreeR(N) = listTreeR1(N, nil);

