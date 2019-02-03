(*
Exercise 8.2.6

Design a structure Queue that represents a queue of elements of some arbitrary
type. Include operations: create (return an empty queue), enqueue (add an
element to the end of the queue and return the result), dequeue (return a pair
consisting of the first element on the queue and the rest of the queue), and
isEmpty (tell whether the queue is empty). Also include the exception EmptyQueue
to catch attempts at dequeueing from the empty queue.
*)

structure Queue = struct
  exception EmptyQueue;

  type 'a queue = 'a list;

  fun create() = nil;

  fun enqueue(x, xs) = xs @ [x];

  fun dequeue(nil)   = raise EmptyQueue
    | dequeue(x::xs) = (x, xs);

  fun isEmpty(nil) = true
    | isEmpty(Q)   = false;
end;

