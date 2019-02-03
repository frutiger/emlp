(*
Exercise 8.2.5

Design a suitable signature that will allow us to create from Stack of Exercise
8.2.4 a structure StringStack whose stacks have elements that are strings, and
that omits the operation top.
*)

use "8.2/8.2.4.sml";

signature STRINGSTACK = sig
  type 'a stack;

  val create: unit -> string stack;
  val push: (string * string stack) -> string stack;
  val pop: string stack -> string stack;
  val isEmpty: string stack -> bool;
end;

structure StringStack: STRINGSTACK = Stack;

