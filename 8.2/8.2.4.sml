(*
Exercise 8.2.4

Design a structure Stack that represents a stack of elements of some arbitrary
type. Include the functions: create (return an empty stack), push (add an
element to the top of the stack and return the resulting stack), pop (delete the
top element and return the resulting stack), isEmpty (test whether a given stack
is empty), and top (return the top element). Also include an exception
EmptyStack to catch attempts to read or pop the top element of an empty stack.
*)

structure Stack = struct
  exception EmptyStack;

  type 'a stack = 'a list;

  fun create() = nil: 'a list;

  fun push(x, xs) = x::xs;

  fun pop(nil)   = raise EmptyStack
    | pop(x::xs) = xs;

  fun isEmpty(nil) = true
    | isEmpty(S)   = false;

  fun top(nil)   = raise EmptyStack
    | top(x::xs) = x;
end;

