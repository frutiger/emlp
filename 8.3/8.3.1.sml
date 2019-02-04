(*
Exercise 8.3.1

In place of the structure String of Fig. 8.8, write a structure that defines
elements to be tuples of three real numbers.  For the lt ordering on triples,
say that (a,b,c) < (x,y,z) if either

1. a < x, or
2. a = x and b < y, or
3. a = x, b = y, and c < z.

Then show how to apply the functor MakeBST of Fig. 8.7 to your new structure
and get a structure that stores triples of reals in binary trees.
*)

(* Figure 8.7 (and ancillaries) is reproduced below *)
signature TOTALORDER = sig
  type element;
  val lt : element * element -> bool
end;

functor MakeBST(Lt: TOTALORDER):
  sig
    type 'label btree;
    exception EmptyTree;
    val create: Lt.element btree;
    val lookup: Lt.element * Lt.element btree -> bool;
    val insert: Lt.element * Lt.element btree -> Lt.element btree;
    val deletemin : Lt.element btree -> Lt.element * Lt.element btree;
    val delete : Lt.element * Lt.element btree -> Lt.element btree
  end
  =
  struct
    open Lt;

    datatype 'label btree
      = Empty
      | Node of 'label * 'label btree * 'label btree;

    val create = Empty;

    fun lookup(x, Empty) = false
      | lookup(x, Node(y, left, right)) =
        if lt(x, y)
        then lookup(x, left)
        else if lt(y, x)
          then lookup(x, right)
          else (* x=y *) true;

    fun insert(x, Empty) = Node(x, Empty, Empty)
      | insert(x, T as Node(y, left, right)) =
          if lt(x, y)
          then Node(y, insert(x, left), right)
          else
            if lt(y, x)
            then Node(y, left, insert(x, right))
            else (* x=y *) T; (* do nothing; x was already there *)

    exception EmptyTree;

    fun deletemin(Empty) = raise EmptyTree
      | deletemin(Node(y, Empty, right)) = (y, right)
                                           (* The critical case. If the left
                                              subtree is empty, then the element
                                              at current node is min. *)
      | deletemin(Node(w, left, right)) = let
          val (y, L) = deletemin(left)
      in
        (y, Node(w, L, right))
      end;

    fun delete(x, Empty) = Empty
      | delete(x, Node(y, left, right)) =
          if lt(x, y)
          then Node(y, delete(x, left), right)
          else if lt(y, x)
            then Node(y, left, delete(x, right))
            else (* x=y *) case (left, right)
              of (Empty, r) => r
               | (l, Empty) => l
               | (l, r)     => let
                 val (z, r1) = deletemin(r)
               in
                 Node(z, l, r1)
               end;
  end;

(* We now proceed with the solution Exercise 8.3.1 *)

structure RealTriple: TOTALORDER = struct
  type element = real * real * real;

  fun lt((l1:real, l2:real, l3:real), (r1, r2, r3)) =
    Real.<(l1, r1) orelse
    (Real.==(l1, r1) andalso Real.<(l2, r2)) orelse
    (Real.==(l1, r1) andalso Real.==(l2, r2) andalso Real.<(l3, r3));
end;

structure RealTripleBST = MakeBST(RealTriple);

