use "3.6/3.6.1.sml";

val [multname, poly1Size, poly2Size] = CommandLine.arguments();

fun getmult("komult") = komult
  | getmult("pmult")  = pmult
  | getmult(_)        = raise Match;

val SOME size1 = Int.fromString(poly1Size);
val SOME size2 = Int.fromString(poly2Size);
getmult(multname)(genPoly(size1), genPoly(size2));
OS.Process.exit(0);

