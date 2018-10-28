(*
Exercise 5.1.1

Rewrite the functions finishInt and finishInt1 from Fig 4.10 to use a single
function with a case statement.

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

fun startInt(file) = startInt1(file, TextIO.input1(file))

and startInt1(file, NONE)   = END
  | startInt1(file, SOME c) = if digit(c)
    then ord(c) - ord(#"0")
    else startInt(file);

fun finishInt(i, file) =
  if   i = END
  then END
  else case TextIO.input1(file)
       of   NONE   => i
          | SOME c => if   digit(c)
                      then finishInt(10 * i + ord(c) - ord(#"0"), file)
                      else i;

fun getInt(file) = finishInt(startInt(file), file);

