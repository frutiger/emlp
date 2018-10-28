(*
Exercise 4.4.3

Rewrite functions startInt and startInt1 of Fig. 4.10 so they are not
mutually recursive.  Do the same for functions finishInt and finishInt1.

startInt, startInt1, finishInt, finishInt1, their dependencies the usage of
the startInt and finishInt are reproduced below.

open TextIO;

val END = ~1;

fun digit(c) = c >= #"0" andalso c <= #"9";

fun startInt(file) = startInt1(file, input1(file))

and startInt1(file, NONE)   = END
  | startInt1(file, SOME c) = if digit(c)
    then ord(c) - ord(#"0")
    else startInt(file);

fun finishInt(i, file) = if i = END
  then END
  else finishInt1(i, file, input1(file))

and finishInt1(i, file, NONE)   = i
  | finishInt1(i, file, SOME c) = if digit(c)
    then finishInt(10 * i + ord(c) - ord(#"0"), file)
    else i;

fun getInt(file) = finishInt(startInt(file), file);

*)

val END = ~1;

fun digit(c) = c >= #"0" andalso c <= #"9";

fun startInt1(file, NONE)   = END
  | startInt1(file, SOME c) = if digit(c)
    then ord(c) - ord(#"0")
    else startInt1(file, TextIO.input1(file));

fun startInt(file) = startInt1(file, TextIO.input1(file));

fun finishInt1(i, file, NONE)   = i
  | finishInt1(i, file, SOME c) = if digit(c)
    then finishInt1(10 * i + ord(c) - ord(#"0"), file, TextIO.input1(file))
    else i;

fun finishInt(i, file) = if i = END
  then END
  else finishInt1(i, file, TextIO.input1(file));

fun getInt(file) = finishInt(startInt(file), file);

