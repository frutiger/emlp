(*
Exercise 8.5.5

Specify a structure Hash similar to the result structure for the functor
MakeHash of Exercise 8.3.3. However, your structure should incorporate the
elements of the hash table designed in Fig. 7.9 and work for elements that are
strings. Your structure will need:

  1. The number of buckets, b,

  2. The hash function h defined as in Fig. 7.9,

  3. The functions lookupBucket, lookup, insertBucket, insert, deleteBucket, and
     delete, as in Fig. 7.9,

  4. A function create() that returns an empty hash table.
*)

structure HashImpl = struct
  val b = 10;

  fun h1(nil) = 0
    | h1(x::xs) = (ord(x) + h1(xs)) mod b;

  fun h(x) = h1(explode(x));

  datatype Cell
    = Empty
    | Deleted
    | Filled of string;

  type Table = Cell Array.array;

  exception Full;

  fun create() = Array.array(b, Empty);

  fun insert1(table, checked, index, element) =
    if checked = b
    then raise Full
    else
      case Array.sub(table, index)
      of Empty     => Array.update(table, index, Filled(element))
       | Deleted   => insert1(table,
                              checked + 1,
                              (index + 1) mod b,
                              element)
       | Filled(x) => if x = element
                      then ()
                      else insert1(table,
                                   checked + 1,
                                   (index + 1) mod b,
                                   element);

  fun insert(table, element) =
    let
      val start = h(element)
    in
      insert1(table, 0, start, element)
    end;

  fun lookup1(table, checked, index, element) =
    if checked = b
    then false
    else
      case Array.sub(table, index)
      of Empty     => false
       | Deleted   => lookup1(table,
                              checked + 1,
                              (index + 1) mod b,
                              element)
       | Filled(x) => x = element orelse
                      lookup1(table,
                              checked + 1,
                              (index + 1) mod b,
                              element);

  fun lookup(table, element) =
    let
      val start = h(element)
    in
      lookup1(table, 0, start, element)
    end;

  fun delete1(table, checked, index, element) =
    if checked = b
    then ()
    else
      case Array.sub(table, index)
      of Empty     => ()
       | Deleted   => delete1(table,
                              checked + 1,
                              (index + 1) mod b,
                              element)
       | Filled(x) => if x = element
                      then Array.update(table, index, Deleted)
                      else delete1(table,
                                   checked + 1,
                                   (index + 1) mod b,
                                   element);

  fun delete(table, element) =
    let
      val start = h(element)
    in
      delete1(table, 0, start, element)
    end;
end;

(*
a) Which of the above elements is it appropriate to make available to users
of the structure Hash?

Only the functions: create, insert, lookup, delete.
*)

(*
b) Show how to hide the inappropriate elements [as determined in part (a)]
by using a signature.
*)

structure HashWithSig: sig
  type Table;

  val create: unit -> Table;
  val insert: Table * string -> unit;
  val lookup: Table * string -> bool;
  val delete: Table * string -> unit;
end = HashImpl;

(*
c) Show how to hide the inappropriate elements by using local definitions.
*)

structure HashWithLocals = struct
  local
    structure Impl = HashImpl;
  in
    val create = Impl.create;
    val insert = Impl.insert;
    val lookup = Impl.lookup;
    val delete = Impl.delete;
  end;
end;

