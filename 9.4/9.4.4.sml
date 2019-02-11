(*
Exercise 9.4.4

Write a function mask(w, i, j) that takes a word w and masks out (sets to 0) all
positions except for the j positions starting at position i.  When counting
positions, start at the right end with position 0.
*)

fun mask(w, i, j) =
  let
    val wordI = Word.fromInt(i);
    val wordJ = Word.fromInt(j);
    val maskBase = Word.<<(0w1, wordJ + 0w1) - 0w1
    val mask = Word.<<(maskBase, wordI)
  in
    Word.andb(w, mask)
  end;

