(*
Exercise 7.4.1

Another approach to hashing, called closed hashing, is to store only one element
in each bucket, rather than a list of elements. If we want to store an element x
in bucket h(x), but that bucket is filled, then we instead try buckets h(x) + 1,
h(x) + 2, and so on. If we reach the last bucket, we go around to bucket 0 and
continue searching for an empty bucket. If we come back to where we started,
then the table is full, and the insertion fails.

To lookup element x, we must search not only bucket h(x), but the following
buckets (continuing to bucket 0 if we reach the last bucket), until we find an
empty bucket. Moreover, when we delete, we cannot simply mark the bucket as
empty. If we did, then lookups might stop too soon. Instead, we need another
value that says "this bucket may be filled, but in lookups it should not be
considered empty.

Write functions insert, delete, and lookup that use the strategy outlined above.
Hint: A useful datatype to define for the cells of the array is a generalization
of the option. This datatype has two parameterless data constructors, Empty for
a bucket that has never been filled, and Deleted for a bucket that was once
filled but whose element was deleted. In addition, there is a third data
constructor, say Filled, that takes a parameter: a value of the type of
hash-table elements.
*)

fun stringHash1(b, nil)   = 0
  | stringHash1(b, x::xs) = (ord(x) + stringHash1(b, xs)) mod b;

fun stringHash b x = stringHash1(b, explode(x));

datatype 'a Cell = Empty
                 | Deleted
                 | Filled of 'a;

exception Full;

fun insert1(table, checked, index, element) =
  if checked = Array.length(table)
  then raise Full
  else
    case Array.sub(table, index)
    of Empty     => Array.update(table, index, Filled(element))
     | Deleted   => insert1(table,
                            checked + 1,
                            (index + 1) mod Array.length(table),
                            element)
     | Filled(x) => if x = element
                    then ()
                    else insert1(table,
                                 checked + 1,
                                 (index + 1) mod Array.length(table),
                                 element);

fun insertGeneric h table element =
  let
    val start = h(element)
  in
    insert1(table, 0, start, element)
  end;

fun lookup1(table, checked, index, element) =
  if checked = Array.length(table)
  then false
  else
    case Array.sub(table, index)
    of Empty     => false
     | Deleted   => lookup1(table,
                            checked + 1,
                            (index + 1) mod Array.length(table),
                            element)
     | Filled(x) => x = element orelse
                    lookup1(table,
                            checked + 1,
                            (index + 1) mod Array.length(table),
                            element);

fun lookupGeneric h table element =
  let
    val start = h(element)
  in
    lookup1(table, 0, start, element)
  end;

fun delete1(table, checked, index, element) =
  if checked = Array.length(table)
  then ()
  else
    case Array.sub(table, index)
    of Empty     => ()
     | Deleted   => delete1(table,
                            checked + 1,
                            (index + 1) mod Array.length(table),
                            element)
     | Filled(x) => if x = element
                    then Array.update(table, index, Deleted)
                    else delete1(table,
                                 checked + 1,
                                 (index + 1) mod Array.length(table),
                                 element);

fun deleteGeneric h table element =
  let
    val start = h(element)
  in
    delete1(table, 0, start, element)
  end;

val buckets = 2;
val table   = Array.array(buckets, Empty:string Cell);
val hash    = stringHash buckets;
val insert  = insertGeneric hash table;
val lookup  = lookupGeneric hash table;
val delete  = deleteGeneric hash table;

