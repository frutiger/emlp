(*
Exercise 7.2.1

Write expressions to perform the following operations.

a) Create an array A of 20 elements, each of which is initially an empty list
of reals.
*)

Array.array(20, nil:real list);

(*
b) Create an array A of 100 reals, each of which is initially 0.
*)

Array.array(100, 0.0);

(*
c) Find the 30th element in an array A of 100 reals,
*)

Array.sub(Array.array(100, 0.0), 30);

(*
d) Find the 10th element in an array A of 20 integers.
*)

Array.sub(Array.array(20, 0), 10);

(*
e) Change the element with index 10 in array A to 43.
*)

Array.update(Array.array(20, 0), 43, 10);

(*
f) Change the element with index 0 in array A to [1,2,3].
*)

Array.update(Array.array(20, nil:int list), 0, [1,2,3]);

