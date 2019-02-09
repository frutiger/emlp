(*
Exercise 8.5.1

A 2-3 tree is a search tree in which each node that is not a leaf has either two
or three children. The labels, which for simnlicitv we shall take to be
integers, appear only at the leaves. The subtrees of a node preserve order; that
is, the labels in the first subtree are less than those of the second subtree,
which are less than the labels of the third subtree if it exists. A node with
two subtrees has one separator, an integer equal to the lowest of the labels of
the second subtree. A node with three subtrees has two separators, one giving
the lowest label of the second subtree and the other giving the lowest label of
the third subtree. Thus, as we search down the tree for a given integer x, the
separators tell us which way to go, just as the labels at interior nodes do for
a binary search tree.

2-3 trees allow fast insertion, deletion, and lookup, just like binary search
trees. However, 2-3 trees remain balanced; that is, all leaves remain the same
distance from the root if insertion and deletion are performed properly. That
balance guarantees time per operation that is proportional to the logarithm of
the number of nodes in the tree, while in the worst case, binary-search-tree
operations can be linear per operation. In this exercise, we shall deal only
with lookup and insertion.

The insertion algorithm is complex. The idea is that if we are to insert x into
the tree T rooted at some node N, there are three cases.

1. If N is a leaf, we return a pair of 2-3 trees; one consists of the leaf N and
   the other consists of a leaf with label x. We shall call this form of return
   value a pair.

2. If N has two subtrees, use the separator to tell where x should be inserted
   and recursively insert x into that subtree. The value returned is either a
   pair of trees or a single tree. If it is a single tree, that tree replaces
   the subtree into which the insertion was made. If the result is a pair, those
   trees become subtrees of N, which now is a 3-subtree node. Adjust the
   separators appropriately. Note that in order to have the proper separators,
   when a pair of trees is returned a third component must be returned as well
   to separate the two trees.

3. If N has three subtrees, use the separators to tell into which subtree x must
   go, and recursively insert x there. If a single tree is returned, substitute
   it as in case (2). However, if a pair is returned, N now has four subtrees.
   Split them into two groups of two subtrees, and split N into two nodes that
   become the roots of two new trees. Then return the resulting pair of trees.
   The situation is suggested by Fig. 8.18, where we assume the insertion has
   been in the middle subtree.

If at the root a pair is returned, create a new root with these trees as
subtrees. For a more detailed explanation of how 2-3 trees work, see A. V. Aho,
J. E. Hopcroft, and J. D. Ullman, Data Structures and Algorithms, Addison-
Wesley, Reading MA, 1983.

In this exercise, you are asked to write a structure that supports the
operations of create (create a tree consisting of one leaf with a given integer
label), lookup, and insert on 2-3 trees. We shall not deal with deletion here.
Start with a datatype having no parameters and three data constructors, for
leaves, 2-subtree nodes, and 3-subtree nodes. Note the labels of leaves are
integers, so there is no need for type parameters in this datatype. Next, create
a datatype that wraps either a single tree in data constructor S or wraps a pair
of trees and an integer separator in the data constructor P. You will need a
number of auxiliary functions including, but not limited to, a function we shall
call insert1.  This function takes an integer x to be inserted and a tree T
into which the insertion occurs and returns a wrapped tree (in S) or a wrapped
pair of trees (in P). Consult the solutions if you cannot write this code, since
it is necessary for the exercises that follow.
*)

structure TwoThreeTree = struct
  datatype Tree
    = Leaf      of int
    | TwoTree   of Tree * int * Tree
    | ThreeTree of Tree * int * Tree * int * Tree;

  fun create x = Leaf x;

  datatype InsertIntermediate
    = S of Tree
    | P of Tree * int * Tree;

  fun insert1(Leaf x, a)
        = if a < x
          then P(Leaf a, x, Leaf x)
          else P(Leaf x, a, Leaf a)
    | insert1(TwoTree(L, x, R), a)
      = if a < x
        then
          case insert1(L, a)
            of S(L)        => S(TwoTree(L, x, R))
             | P(L, x0, M) => S(ThreeTree(L, x0, M, x, R))
        else
          (case insert1(R, a)
            of S(R)        => S(TwoTree(L, x, R))
             | P(M, x1, R) => S(ThreeTree(L, x, M, x1, R)))
    | insert1(ThreeTree(L, x, M, z, R), a)
      = if a < x
        then
          case insert1(L, a)
            of S(L)         => S(ThreeTree(L, x, M, z, R))
             | P(L, x0, M0) => P(TwoTree(L, x0, M0),
                                 x,
                                 TwoTree(M, z, R))
        else
          if a < z
          then
            case insert1(M, a)
              of S(M) => S(ThreeTree(L, x, M, z, R))
               | P(M0, y, M1) => P(TwoTree(L, x, M0),
                                   y,
                                   TwoTree(M1, y, R))
          else
            case insert1(R, a)
              of S(R)         => S(ThreeTree(L, x, M, z, R))
               | P(M1, y1, R) => P(TwoTree(L, x, M),
                                   z,
                                   TwoTree(M1, y1, R));

  fun insert(T, a) =
    case insert1(T, a)
      of S(T)       => T
       | P(L, x, R) => TwoTree(L, x, R);

  fun lookup(Leaf x, a) = a = x
    | lookup(TwoTree(L, x, R), a) = if a < x
                                    then lookup(L, a)
                                    else lookup(R, a)
    | lookup(ThreeTree(L, x, M, y, R), a) = if a < x
                                            then lookup(L, a)
                                            else if a < y
                                                 then lookup(M, a)
                                                 else lookup(R, a);
end;

