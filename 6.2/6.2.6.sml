(*
Exercise 6.2.6

Define mutually recursive datatypes zeroTree, oneTree, and twoTree to be those
binary trees whose every path from the root to a node with at least one empty
subtree has length whose remainder when divided by 3 is 0, 1, or 2 respectively.
*)

datatype zeroTree = Empty | TwoNode  of twoTree  * twoTree
     and twoTree  =         OneNode  of oneTree  * oneTree
     and oneTree  =         ZeroNode of zeroTree * zeroTree;

