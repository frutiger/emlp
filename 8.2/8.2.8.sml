(*
Exercise 8.2.8

Write a structure that can serve as a simple matrix package, modeled on the
operations used in Section 7.5. For example, you will want to include functions
such as:

1. create(n) returns an n x n matrix of 0.0's.
2. assign(M, i, j, x) sets element M_ij to x.
3. assignRow(M, i, L) sets the ith row of matrix M to the list of elements L.
4. rowOp(M, c, i, j) subtracts c times the ith row from the jth row of matrix M.
5. columnOp(M, c, i, j) subtracts c times the ith column from the jth column.
*)

structure Matrix = struct
  type matrix = real Array.array Array.array;

  fun create(n) = let
      val i      = ref 1;
      val result = Array.array(n, Array.array(n, 0.0))
    in (
      while !i < n
      do (
        Array.update(result, !i, Array.array(n, 0.0));
        i := !i + 1
      );
      result
    ) end;

  fun assign(M, i, j, x) = Array.update(Array.sub(M, i), j, x);

  fun assignRow(M, i, L) = Array.update(M, i, Array.fromList(L));

  fun rowOp(M, c, i, j) = let
      val col = ref 0
    in
      while !col < Array.length(M)
      do (
        let
          val src = Array.sub(Array.sub(M, i), !col);
          val dst = Array.sub(Array.sub(M, j), !col);
          val res = dst - c * src;
        in
          Array.update(Array.sub(M, j), !col, res)
        end;
        col := !col + 1
      )
  end;

  fun columnOp(M, c, i, j) = let
      val row = ref 0
    in
      while !row < Array.length(M)
      do (
        let
          val src = Array.sub(Array.sub(M, !row), i);
          val dst = Array.sub(Array.sub(M, !row), j);
          val res = dst - c * src;
        in
          Array.update(Array.sub(M, !row), j, res)
        end;
        row := !row + 1
      )
  end;
end;

(*
What other functions would be useful to have?

Other useful functions would include:

  1. get(M, i, j) returns the value at the ith row and jth column
  2. swap(M, i, j) swap the ith and the jth rows
*)
