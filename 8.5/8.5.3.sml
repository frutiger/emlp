(*
Exercise 8.5.3

Accomplish the same goal as Exercise 8.5.2 without a new signature by making
auxiliary functions local.
*)

use "8.5/8.5.1.sml";

structure TwoThreeTree = struct
  local
    type InsertIntermediate = TwoThreeTree.InsertIntermediate;
    val insert1 = TwoThreeTree.insert1;
  in
    val create = TwoThreeTree.create
    val lookup = TwoThreeTree.lookup
    val insert = TwoThreeTree.insert
  end
end;

