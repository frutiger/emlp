(*
Exercise 8.3.2

A useful class of structures implements a set of elements of some type with a
"similarity" relation that is defined by a function that tells whether two
elements are "similar." For instance, the set could have strings as elements.
Strings could be deemed similar if they where the same after converting
upper-case letters to lower case. Alternatively, strings could be considered
similar if they differed in only one position. For another example, elements
could be lists of bits indicating whether a document discussed various topics of
interest, and "similar" could mean that two documents covered at least two
topics in common.

a) Write a signature SIM that describes structures that are an element type with
   a similarity relation on that type.
*)

signature SIM = sig
  eqtype element;
  val similar: element * element -> bool;
end;

(*
b) Write a functor MakeSimSet that takes as argument a structure Sim that
   includes an element type and a function that decides similarity. The result
   of your functor should be a structure that implements sets with the given
   type and notion of similarity. The operations in the result structure should
   include:

   1. A function findSim that takes an element x and a set S and returns the set
      of elements in S that are similar to x,

   2. A value create to be an empty set, and

   3. A function insert to return a set with a new element inserted.
*)

functor MakeSimSet(Sim: SIM):
  sig
    type set;

    val create: set;
    val findSim: Sim.element * set -> set;
    val insert: Sim.element * set -> set;
  end
  =
  struct
    type set = Sim.element list;

    val create = nil;

    fun findSim(x, nil)   = nil
      | findSim(x, y::ys) =
          if Sim.similar(x, y)
          then y::findSim(x, ys)
          else findSim(x, ys);

    fun insert(x, nil)   = x::nil
      | insert(x, y::ys) =
          if x=y
          then y::ys
          else y::insert(x, ys);
  end;

(*
c) Write a structure Misspell that defines elements to be strings and defines
   two strings to be similar if they are identical or differ in exactly one
   character. Apply your functor from (a) to produce the structure MisspellSet
   that implements sets of strings and allows searches for slightly misspelled
   words.
*)

structure Misspell: SIM = struct
  type element = string;

  fun similar1(nil,   nil)   = true
    | similar1(_,     nil)   = false
    | similar1(nil,   _)     = false
    | similar1(x::xs, y::ys) =
        if x = y
        then similar1(xs, ys)
        else xs = ys;

  fun similar(x, y) = similar1(explode(x), explode(y));
end;

structure MisspellSet = MakeSimSet(Misspell);

