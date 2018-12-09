(*
Exercise 6.2.4

In Fig. 4.10 we wrote a program to read and sum integers, using the awkward
convention that -1 represented the situation where the end of file had been
reached and no integer was available. A better approach is to define a datatype
intOrEof that has one data constructor Eof to represent the absence of an
integer and another data constructor Integer that wraps an integer. Rewrite Fig.
4.10 to use this strategy and avoid the use of -1, which was represented there
by the identifier END.

Fig 4.10 is reproduced below.

open TextIO;

val END = ~1;

fun digit(c) = c >= #"0" andalso c <= #"9";

fun startInt(file) = startInt1(file, input1(file))

and startInt1(file, NONE) = END
  | startInt1(file, SOME c) =
    if digit(c) then ord(c)-ord(#"0")
    else startInt(file);

fun finishInt(i,file) =
  if i = END then END
  else finishInt1(i,file,input1(file))

and finishInt1(i, file, NONE) = i
  | finishint1(i, file, SOME c) =
    if digit(c) then
      finishInt(10*i+ord(c)-ord(#"0"), file)
    else i;

fun getInt(file) = finishInt(startInt(file), file);

fun sumInts(file) =
  let
    val i = getInt(file)
  in
    if i = END then 0
    else i + sumInts(file)
  end;

fun sumInts(filename) = sumInts(openIn(filename));
*)

datatype intOrEof = Int of int | Eof;

fun digit(c) = c >= #"0" andalso c <= #"9";

fun startInt(file) = startInt1(file, TextIO.input1(file))

and startInt1(file, NONE) = Eof
  | startInt1(file, SOME c) =
    if digit(c) then Int(ord(c)-ord(#"0"))
    else startInt(file);

fun finishInt(Eof,file) = Eof
  | finishInt(Int i, file) = finishInt1(i,file,TextIO.input1(file))

and finishInt1(i, file, NONE) = Int i
  | finishInt1(i, file, SOME c) =
    if digit(c) then
      finishInt(Int(10*i+ord(c)-ord(#"0")), file)
    else Int i;

fun getInt(file) = finishInt(startInt(file), file);

fun sumInts1(file) =
  case getInt(file)
    of Eof   => 0
     | Int i => i + sumInts1(file);

fun sumInts(filename) = sumInts1(TextIO.openIn(filename));

