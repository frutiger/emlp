(*
Exercise 7.2.2

Write programs to sort an array A of length n, using:

a) A simple n^2-time sort such as bubblesort or insertion sort.
*)

fun bubbleSortPass(lt, array, index) =
  if index = Array.length(array)
  then false
  else
    let
      val curr = Array.sub(array, index);
      val prev = Array.sub(array, index-1)
    in
      if lt(curr, prev)
      then (
        Array.update(array, index,   prev);
        Array.update(array, index-1, curr);
        true
      )
      else bubbleSortPass(lt, array, index+1)
    end

fun bubbleSort lt array =
  if bubbleSortPass(lt, array, 1) then bubbleSort lt array else array;

(*
b) Mergesort. Hint: Create temporary arrays and merge from two small arrays into
one of twice the size.
*)

fun mergeFrom1(lt, a1, a2, ar, i1, i2, ir) = (
  Array.update(ar, ir, Array.sub(a1, i1));
  merge1(lt, a1, a2, ar, i1+1, i2, ir+1)
)

and mergeFrom2(lt, a1, a2, ar, i1, i2, ir) = (
  Array.update(ar, ir, Array.sub(a2, i2));
  merge1(lt, a1, a2, ar, i1, i2+1, ir+1)
)

and merge1(lt, a1, a2, ar, i1, i2, ir) =
  if i1 < Array.length(a1) andalso i2 < Array.length(a2)
  then
    if lt(Array.sub(a1, i1), Array.sub(a2, i2))
    then mergeFrom1(lt, a1, a2, ar, i1, i2, ir)
    else mergeFrom2(lt, a1, a2, ar, i1, i2, ir)
  else
    if i1 < Array.length(a1)
    then mergeFrom1(lt, a1, a2, ar, i1, i2, ir)
    else
      if i2 < Array.length(a2)
        then mergeFrom2(lt, a1, a2, ar, i1, i2, ir)
        else ();

fun merge(lt, a1, a2) =
  let
    val result = Array.array(Array.length(a1) + Array.length(a2),
                             Array.sub(a1, 0))
  in
    (merge1(lt, a1, a2, result, 0, 0, 0);
    result)
  end;

fun copy(s, si, d, di, n) =
  if n = 0
  then ()
  else (
    Array.update(d, di, Array.sub(s, si));
    copy(s, si+1, d, di+1, n-1)
  );

fun split(a) =
  if Array.length(a) = 1
  then (a, Array.array(0, Array.sub(a, 0)))
  else let
    val l  = Array.length(a) div 2;
    val m  = Array.length(a) mod 2;
    val a1 = Array.array(l+m, Array.sub(a, 0));
    val a2 = Array.array(l, Array.sub(a, 0))
  in (
    copy(a, 0, a1, 0, l+m);
    copy(a, l+m, a2, 0, l);
    (a1, a2)
  ) end;

fun mergeSort lt a =
  if Array.length(a) = 1
  then a
  else let
    val (a1, a2) = split(a)
  in
    merge(lt, mergeSort lt a1, mergeSort lt a2)
  end;

