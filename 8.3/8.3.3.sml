(*
Exercise 8.3.3

Specify a functor MakeHashTable that takes a structure consisting of

  1. A type eltype for the elements of the hash table,

  2. A number of buckets, b, and

  3. A hash function h that takes an element of type eltype and returns an
     integer from 0 to b — 1

and produces a structure with functions insert, delete, and lookup that operate
upon the hash table. Also included in the result structure must be a function
create() that returns an empty hash table.
*)

signature HASHABLE = sig
  eqtype eltype;

  val b: int;
  val h: eltype -> int;
end;

functor MakeHashTable(Hashable: HASHABLE):
  sig
    type Cell;
    type Table = Cell Array.array;

    val create: unit -> Table;
    val insert: Table * Hashable.eltype -> unit;
    val lookup: Table * Hashable.eltype -> bool;
    val delete: Table * Hashable.eltype -> unit;
  end
  =
  struct
    datatype Cell
      = Empty
      | Deleted
      | Filled of Hashable.eltype;

    type Table = Cell Array.array;

    exception Full;

    fun create() = Array.array(Hashable.b, Empty);

    fun insert1(table, checked, index, element) =
      if checked = Hashable.b
      then raise Full
      else
        case Array.sub(table, index)
        of Empty     => Array.update(table, index, Filled(element))
         | Deleted   => insert1(table,
                                checked + 1,
                                (index + 1) mod Hashable.b,
                                element)
         | Filled(x) => if x = element
                        then ()
                        else insert1(table,
                                     checked + 1,
                                     (index + 1) mod Hashable.b,
                                     element);

    fun insert(table, element) =
      let
        val start = Hashable.h(element)
      in
        insert1(table, 0, start, element)
      end;

    fun lookup1(table, checked, index, element) =
      if checked = Hashable.b
      then false
      else
        case Array.sub(table, index)
        of Empty     => false
         | Deleted   => lookup1(table,
                                checked + 1,
                                (index + 1) mod Hashable.b,
                                element)
         | Filled(x) => x = element orelse
                        lookup1(table,
                                checked + 1,
                                (index + 1) mod Hashable.b,
                                element);

    fun lookup(table, element) =
      let
        val start = Hashable.h(element)
      in
        lookup1(table, 0, start, element)
      end;

    fun delete1(table, checked, index, element) =
      if checked = Hashable.b
      then ()
      else
        case Array.sub(table, index)
        of Empty     => ()
         | Deleted   => delete1(table,
                                checked + 1,
                                (index + 1) mod Hashable.b,
                                element)
         | Filled(x) => if x = element
                        then Array.update(table, index, Deleted)
                        else delete1(table,
                                     checked + 1,
                                     (index + 1) mod Hashable.b,
                                     element);

    fun delete(table, element) =
      let
        val start = Hashable.h(element)
      in
        delete1(table, 0, start, element)
      end;
  end;

