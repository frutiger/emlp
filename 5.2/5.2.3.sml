(*
Exercise 5.2.3

In Fig. 4.10 we wrote a progra to read nonnegative integers and signal the end
of file with the integer -1.  It is better to handle this signal with an
exception.  Modify Fig. 4.10 by declaring an exception Eof and raising it in
function startInt when the end of file is found.  Modify function sumInts1 to
handle Eof.  Other functions can ignore Eof, passing the problem to sumInts1.

Fig 4.10 is reproduced below.

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

fun sumInts1(file) = let
  val i = getInt(file)
in
  if i = END
    then 0
    else i + sumInts1(file)
end

and sumInts(filename) = sumInts1(openIn(filename));
*)

fun digit(c) = c >= #"0" andalso c <= #"9";

exception Eof;

fun startInt(file) = startInt1(file, TextIO.input1(file))

and startInt1(file, NONE)   = raise Eof
  | startInt1(file, SOME c) = if digit(c)
    then ord(c) - ord(#"0")
    else startInt(file);

fun finishInt(i, file) = finishInt1(i, file, TextIO.input1(file))

and finishInt1(i, file, NONE)   = i
  | finishInt1(i, file, SOME c) = if digit(c)
    then finishInt(10 * i + ord(c) - ord(#"0"), file)
    else i;

fun getInt(file) = finishInt(startInt(file), file);

fun sumInts1(file) = let val i = getInt(file)
                     in  i + sumInts1(file)
                     end
                     handle Eof => 0

and sumInts(filename) = sumInts1(TextIO.openIn(filename));

