(*
Exercise 6.2.1

Give an example of a value of type int btree, where btree is the datatype
defined in Example 6.5. Your tree should have 3 nodes.

Example 6.5 is reproduced below.
*)

datatype 'label btree =
  Empty |
  Node of 'label * 'label btree * 'label btree;

(*
The solution to the exercise is provided below.
*)

val it =
  Node(
    5,
    Node(
      4,
      Empty,
      Empty),
    Node(
      7,
      Empty,
      Empty));
