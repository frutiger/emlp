use "3.6/3.6.1.sml";

val [multname, polySize] = CommandLine.arguments();

fun getmult("komult") = komult
  | getmult("pmult")  = pmult
  | getmult(_)        = raise Match;

val SOME size = Int.fromString(polySize);
getmult(multname)(genPoly(size), genPoly(size));
OS.Process.exit(0);
