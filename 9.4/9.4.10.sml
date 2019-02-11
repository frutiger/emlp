(*
Exercise 9.4.10

Use the function List.partition to write functions that do the following:

a) Given a list of strings, divide the list into those strings that are 10
   characters or longer and those that are shorter than 10 characters.
*)

val stringsLengthTen = List.partition(fn s => size(s) >= 10);

(*
b) Given a list of integers, divide the list into three lists, consisting of
   those integers that are divisible by 3, those that leave a remainder of 1
   when divided by 3, and those that leave a remainder of 2 when divided by 3.
*)

fun threes L = let
  val (zeros, rest) = List.partition (fn x => x mod 3 = 0) L;
  val (ones,  twos) = List.partition (fn x => x mod 3 = 1) rest;
in
  [zeros, ones, twos]
end;

(*
c) Given a list L of integers and an integer m, produce the list of lists [L0,
   L1,..., Lm-1], where Li consists of those integers on list L that leave a
   remainder of i when divided by m.
*)

fun split1(L, m, i) =
  if m = i
  then nil
  else #1 (List.partition (fn x => x mod m = i) L)::split1(L, m, i+1);

fun split(L, m) = split1(L, m, 0);

