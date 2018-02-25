(*
Exercise 4.1.2

Write the function comb, computing (n, m), in such a way that when we call
comb(n, m) it prints n and m before printing the result.  Print out suitable
words so that n, m and (n, m) are distinguishable from each other.

comb from Fig 3.13 is included below.
*)

fun comb(_, 0) = 1
  | comb(n, m) = if n = m then 1
                 else comb(n-1, m) + comb(n-1, m-1);

fun printComb(n, m) = (
  print("There are ");
  print(Int.toString(comb(n, m)));
  print(" ways to select ");
  print(Int.toString(m));
  print(" out of ");
  print(Int.toString(n));
  print(" items.\n")
);

