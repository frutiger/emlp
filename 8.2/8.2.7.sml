(*
Exercise 8.2.7

Design a suitable signature that will allow us to create from Queue of Exercise
8.2.6 a structure PairQueue whose queues have elements that are pairs consisting
of a string and an integer. Do not omit any of the functions.
*)

use "8.2/8.2.6.sml";

signature PAIRQUEUE = sig
  type 'a queue;

  val create: unit -> (string * int) queue;
  val enqueue: ((string * int) * (string * int) queue) -> (string * int) queue;
  val dequeue: (string * int) queue -> (string * int) * (string * int) queue;
  val isEmpty: (string * int) queue -> bool;
end;

structure PairQueue: PAIRQUEUE = Queue;

