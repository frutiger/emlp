(*
Exercise 7.4.2

The function insertList of Fig. 7.9 can be made more efficient if we just insert
the element onto the front of the list without checking whether or not it is
already on the list. However, if we do so, then the deleteList function must be
modified as well. Why? (Hint: consider what happens if x is inserted, inserted
again, and then deleted.) Write revised functions to support duplicate elements
on a bucket list.

insertList and deleteList from Fig. 7.9 are reproduced below:

fun insertList(x,nil) = [x]
  | insertList(x,y::ys) =
        if x=y then y::ys
        else y::insertList(x,ys);

fun deleteList(x,nil) = nil
  | deleteList(x,y::ys) =
        if x=y then ys
        else y::deleteList(x,ys);
*)

fun insertList(x, L) = x::L;

fun deleteList(x, nil) = ()
  | deleteList(x, y::ys) =
        if x=y then deleteList(x, ys)
        else y::deleteList(x, ys);

