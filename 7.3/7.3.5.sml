(*
Exercise 7.3.5

In Pascal, C, and many other languages, there is a linked-list data structure
that we assume is familiar to the reader. There is generally no need to
implement this sort of data structure in ML because we have such lists as a
primitive, and the implementation of lists in ML is, "behind the scenes," very
much like the standard linked list. However, it is an interesting exercise to
mimic the linked list using records and references in ML. That is, each cell of
a linked list is a record with an element field carrying the data and a next
field that is a reference to the next cell.

Hint: In other languages, a "nil pointer" is a legitimate value of any pointer
type, but we do not have the luxury in ML of such a versatile value (although
nil essentially has that versatility for normal ML lists). Thus, we need to
create a datatype with two constructors, Nil and Cell, to indicate whether a
next field "points" to another cell or is "nil."

a) Devise the datatype for cells of "conventional" linked lists.
*)

datatype 'a List = Cell of { data: 'a, next: 'a List }
                 | Nil;

(*
b) Write a function pop that takes a linked list as argument and produces
the tail of that linked list. Raise the exception Empty (a built-in exception
of ML) if the linked list is empty.
*)

fun pop(Nil)                 = raise Empty
  | pop(Cell({ next, ... })) = next;

(*
c) Write a function skip that takes a cell C as argument and changes the
next field of C to point to the cell pointed to by the cell that C originally
pointed to. Raise the exception BadCell if this operation is impossible.
*)

exception BadCell;

fun skip(Nil) = raise BadCell
  | skip(Cell({ next = Nil, ... })) = raise BadCell
  | skip(Cell({ data,
                next = Cell({ next, ... })
              })) = Cell({ data = data,
                           next = next });

(*
d) Write a function that takes a linked list and produces an ML list of all
the elements in all its cells.
*)

fun listify(Nil)                  = nil
  | listify(Cell({ data, next })) = data::listify(next);

