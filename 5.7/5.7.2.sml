(*
Exercise 5.7.2

ML allows us to construct values from integers using list-formation (with square
brackets) and tuple-formation (with parentheses). An example is [(1,2),
(3,4)].

a) Give grammatical diagrams for the set of values that can be formed by these
   two construction rules. You do not need to enforce the ML requirement that
   list elements have the same type.

INT: -->--[ 0-9 ]-->--
         \       /
          \--<--/

ATOM: -->---[ TERM ]--->---
        \               /
         \->-[ INT ]->-/

ATOMS: -->--------------[ ATOM ]-------------->--
           \                                /
            \--[ <whitespace> ]--<--[ , ]<-/

LIST: -->--[ [ ]--------->---------[ ] ]-->--
                 \               /
                  \->[ ATOMS ]->/

TUPLE: -->--[ ( ]-------->----------[ ) ]-->--
                  \               /
                   \->[ ATOMS ]->/

TERM: -->--[ LIST ]-->--
         \           /
          -[ TUPLE ]-

EXPR: -->--[ TERM ]-->--[ $ ]-->--

b) Implement a parser for this class of character strings. You should read the
   input from an instream IN. The response of your parser is a boolean
   indicating whether the input is or is not of the proper form. Your program
   should allow white space among the integers, parentheses, commas, and
   brackets, but not in the middle of an integer. The entire value will be
   terminated by the character $.
*)

fun skipWs(ins) =
  case TextIO.lookahead(ins)
    of SOME #" " => (TextIO.input1(ins); ())
     | _         => ()

and parseInt(ins) =
  case TextIO.lookahead(ins)
    of SOME #"0" => (TextIO.input1(ins); parseIntTail(ins))
     | SOME #"1" => (TextIO.input1(ins); parseIntTail(ins))
     | SOME #"2" => (TextIO.input1(ins); parseIntTail(ins))
     | SOME #"3" => (TextIO.input1(ins); parseIntTail(ins))
     | SOME #"4" => (TextIO.input1(ins); parseIntTail(ins))
     | SOME #"5" => (TextIO.input1(ins); parseIntTail(ins))
     | SOME #"6" => (TextIO.input1(ins); parseIntTail(ins))
     | SOME #"7" => (TextIO.input1(ins); parseIntTail(ins))
     | SOME #"8" => (TextIO.input1(ins); parseIntTail(ins))
     | SOME #"9" => (TextIO.input1(ins); parseIntTail(ins))
     | _         => false

and parseIntTail(ins) =
  parseInt(ins) orelse
    case TextIO.lookahead(ins)
      of SOME #"," => true
       | SOME #"]" => true
       | SOME #")" => true
       | _         => false

and parseAtom(ins) = parseInt(ins) orelse parseTerm(ins)

and parseAtoms(ins) = parseAtom(ins) andalso parseAtomsTail(ins)

and parseAtomsTail(ins) =
  case TextIO.lookahead(ins)
    of SOME #"," => (TextIO.input1(ins);
                     skipWs(ins);
                     parseAtom(ins) andalso parseAtomsTail(ins))
     | SOME #"]" => true
     | SOME #")" => true
     | _         => false

and parseListTail(ins) =
  case TextIO.lookahead(ins)
    of SOME #"]" => (TextIO.input1(ins); true)
     | _         => parseAtoms(ins) andalso parseListTail(ins)

and parseTupleTail(ins) =
  case TextIO.lookahead(ins)
    of SOME #")" => (TextIO.input1(ins); true)
     | _         => parseAtoms(ins) andalso parseTupleTail(ins)

and parseTerm(ins) =
  case TextIO.lookahead(ins)
    of SOME #"[" => (TextIO.input1(ins); parseListTail(ins))
     | SOME #"(" => (TextIO.input1(ins); parseTupleTail(ins))
     | _         => false

and parse(ins) = parseTerm(ins) andalso
  case TextIO.input1(ins)
    of SOME #"$" => true
     | _         => false;

