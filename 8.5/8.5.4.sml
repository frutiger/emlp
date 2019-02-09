(*
Exercise 8.5.4

Show how to make the data constructors of the datatypes used in your solution to
Exercise 8.5.1 unavailable by using an abstract type.
*)

abstype Tree
  = Leaf      of int
  | TwoTree   of Tree * int * Tree
  | ThreeTree of Tree * int * Tree * int * Tree
with
  local
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
  in
    fun create x = Leaf x;

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
end;

