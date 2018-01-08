(*
Exercse 3.3.11

Suppose we represent sets by lists.  The members of the set may appear in any
order on the list, but we may assume that there is never more than one
occurrence of the same member on thi list.  Write functions to perform the
following operations on sets.

(a) member(x, S) returns true if x is a member of set S; that is if x appears
    somewhere on the list representing S. *)
    fun member(x, y::ys) = x = y orelse member(x, ys)
      | member(x, nil)   = false; (*

(b) delete(x, S) deletes x from S.  Remember that you may assume that x appears
    at most once on the list S. *)
    fun delete(x, y::ys) = if x = y then ys else y::delete(x, ys)
      | delete(x, nil)   = nil; (*

(c) insert(x, S) puts x on the list for S if it is not already there.  Remember
    that in order to preserve the condition that there are no repeating elements
    on a list that represents a set, we must check that x does not already
    appear in S; it is not adequate simply to make x the head of the list. *)
fun insert(x, y::ys)  = if x = y then y::ys else y::insert(x, ys)
  | insert(x, nil)    = x::nil;

