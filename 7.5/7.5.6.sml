(*
Exercise 7.5.6

Code like that of Fig. 7.11 and 7.13 uses integer references to simulate
for-loops in languages like Pascal. We can replace these uses of references if
we define a higher-order function

fun for(a,b,F) =
  if a>b then ()
  else (F(a); for(a+l,b,F));

That is, the function for applies function F to each of the integers between a
and b. The type of for is int * int * (int -> 'a) -> unit. Intuitively, F is the
body of the for-loop, with the current loop index as an argument.
*)

(*
First we define the higher-order 'for' function:
*)
fun for(a, b, F) =
  if a > b then ()
  else (
    F(a);
    for(a + 1, b, F)
  );

(*
a) Rewrite the while-loop of Example 7.7 that prints the integers from 1 to 10,
using for.

The original Example 7.7 follows:

val i = ref 1;

while !i<=10 do (
  print(Int.toString(!i));
  print(" ");
  i := !i + 1
);
*)

for(1, 10, (fn i => (TextIO.print(Int.toString(i)), TextIO.print(" "))));

(*
b) Rewrite the code of Figs. 7.11 and 7.13 using for to avoid all use of
references.

Note: the solutions are written in terms of the functions from Exercise 7.5.4,
which are reproduced below.
*)

fun get(M, i, j) = Array.sub(Array.sub(M, i), j);

fun set(M, i, j, v) = Array.update(Array.sub(M, i), j, v);

(*
The code from Figure 7.11 is reproduced below:

open Array;

val n = 10;

val M = array(n,array(n,0.0));

val i = ref 1;

while !i<n do (
  update(M,!i,array(n,0.0));
  i := !i + 1
);

i := 0;

val j = ref 0;

(* initialize M to be a particular matrix *)

while !i<n do (
  while !j<n do (
    update(sub(M,!i),!j,1.0/real(!i + !j + 1));
    j := !j + 1
  );
  j := 0;
i := !i + 1
);
*)

val n = 10;

val M = Array.array(n, Array.array(n, 0.0));

for(1, n - 1, (fn i => Array.update(M, i, Array.array(n, 0.0))));

for(0,
    n - 1,
    (fn i => for(0,
                 n - 1,
                 (fn j => set(M, i, j, 1.0/real(i + j + 1))))));

(*
The code from Figure 7.13 is reproduced below:

i := 0;
while !i<n-l do (
  j := !i+l;
  while !j<n do
    let
      val ratio = sub(sub(M,!j),!i)/sub(sub(M,!i),!i);
      val k = ref (!i+l)
    in
      update(sub(M,!j),!i,0.0);
      while !k<n do (
        update(sub(M,!j), !k, sub(sub(M,!j),!k) - ratio*sub(sub(M,!i),!k));
        k := !k + 1
      );
      j := !j + 1
    end;
  i := !i + 1
);
*)

for(0,
    n - 2,
    (fn i => for(i + 1,
                 n - 1,
                 (fn j =>
                  let
                    val ratio = get(M, j, i)/get(M, i, i);
                  in (
                    set(M, j, i, 0.0);
                    for(i + 1,
                        n - 1,
                        (fn k => set(M,
                                     j,
                                     k,
                                     get(M, j, k) - ratio * get(M, i, k))))
                  ) end))));

