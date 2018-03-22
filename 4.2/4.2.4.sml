(*
Exercise 4.2.4

Read a file of characters, treating it as sequence of words, which are sequences
of consecutive non-white-space characters.  Each word is followed by either a
single white space character or the end-of-file, so two or more consecutive
white spaces indicate there is an empty word between them.  Return a list of the
words in the file.
*)

open TextIO;

fun parseWords1(words, word, file, SOME #" ")  = parseWords1(words @ [word], "",               file, input1(file))
  | parseWords1(words, word, file, SOME #"\t") = parseWords1(words @ [word], "",               file, input1(file))
  | parseWords1(words, word, file, SOME #"\n") = parseWords1(words @ [word], "",               file, input1(file))
  | parseWords1(words, word, file, SOME next)  = parseWords1(words,          word ^ str(next), file, input1(file))
  | parseWords1(words, word, file, NONE)       = words;

fun parseWords(name) = let
  val f = openIn(name)
in
  parseWords1([], "", f, input1(f))
end;

