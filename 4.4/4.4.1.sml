(*
Exercise 4.4.1

Generalize the program of Fig 4.10 to allow negative integers on the input.  We
assume that negative integers are preceded by the minus sign (-) rather than
the tilde (~).  Note that we not only have to recognize negative integers, but
we can no longer use -1 as a convenient value to indicate that the end of file
has been reached.  Hint: return an integer option that tells whether the end of
file has been reached.

The contents of Fig 4.10 are reproduced below for convenience:

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

fun toint(c) = ord(c) - ord(#"0");

fun startInt(file) = startInt1(file, TextIO.input1(file))

and startInt1(file, NONE)   = NONE
  | startInt1(file, SOME c) = if   c = #"-"
                              then startInt2(file, ~1, TextIO.input1(file))
                              else startInt2(file, 1,  SOME c)

and startInt2(file, sign, NONE)   = NONE
  | startInt2(file, sign, SOME c) = if   digit(c)
                                    then SOME (sign, toint(c))
                                    else startInt(file);

fun finishInt(NONE,           file) = NONE
  | finishInt(SOME (sign, i), file) = finishInt1(sign, i, file, TextIO.input1(file))

and finishInt1(sign, i, file, NONE)   = SOME (sign * i)
  | finishInt1(sign, i, file, SOME c) = if   digit(c)
                                        then finishInt(SOME (sign, (10*i + toint(c))), file)
                                        else SOME (sign * i);

fun getInt(file) = finishInt(startInt(file), file);

fun sumInts2(file, NONE)   = 0
  | sumInts2(file, SOME i) = i + sumInts2(file, getInt(file))

and sumInts1(file) = sumInts2(file, getInt(file))

and sumInts(filename) = sumInts1(TextIO.openIn(filename));

