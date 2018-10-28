(*
Exercise 4.3.2

Write a function to read integers i and b separated by a single non-digit and
print the representation of i in base b.  If b > 10, then represents digits ten
and above by their decimal representation surrounded by parentheses.  For
example, 570 in base 12 is 3(11)6; that is, 570 = 144*3 + 12*11 + 6.  You should
read from an instream 'infile' and write to an outstream 'outfile'.
*)

fun readInt2(f, x, SOME d) = readInt1(f, x*10 + d, TextIO.input1(f))
  | readInt2(f, x, NONE)   = x
and readInt1(f, x, SOME c) = readInt2(f, x, Int.fromString(str(c)))
  | readInt1(f, x, NONE)   = x;

fun readInt(f) = readInt1(f, 0, TextIO.input1(f));

fun convert1(0, base, divisor, result) = result
  | convert1(x, base, divisor, result) =
  let
    val value   = x mod divisor
    val weight  = divisor div base
    val numeral = value div weight
  in
    convert1(x - value, base, base * divisor, numeral::result)
  end;

fun convert(x, base) = convert1(x, base, base, []);

fun outputNum1(f, n) =
  if
    n < 10
  then
    TextIO.output(f, Int.toString(n))
  else
    ( TextIO.output1(f, #"("); TextIO.output(f, Int.toString(n)); TextIO.output1(f, #")") );

fun outputNum(f, n::ns) = (outputNum1(f, n); outputNum(f, ns))
  | outputNum(f, nil)   = (TextIO.output1(f, #"\n"));

fun program(instream, outstream) =
  outputNum(outstream, convert(readInt(instream), readInt(instream)))

