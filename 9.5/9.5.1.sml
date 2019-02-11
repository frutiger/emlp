(*
Exercise 9.5.1

Modify the program of Fig. 9.11 to handle all exceptions, e.g.  command
arguments that are not integers, or arguments that are integers but raise
exception BadN or BadM. Print an appropriate error message and have comb return
the status failure. Remember that local exceptions, such as BadN and BadM cannot
be handled outside their scope.
*)

(* Fig 9.11 follows *)
fun comb1(n,m) =
let
  exception BadN;
  exception BadM;
in
  if n <= 0 then raise BadN
  else if m < 0 orelse m > n then raise BadM
  else if m=0 orelse m=n then 1
  else comb1(n-1,m) + comb1(n-1,m-1)
end;

fun comb(_,[n,m]) =
let
  val nInt = valOf(Int.fromString(n));
  val mInt = valOf(Int.fromString(m));
  val answer = comb1(nInt, mInt)
in
  (
    print(Int.toString(answer));
    print("\n");
    OS.Process.success
  )
end;

(* The solution to Exercise 9.5.1 follows *)
fun comb2(n,m) =
let
  exception BadN;
  exception BadM;
in
  if n <= 0 then raise Fail("Bad N")
  else if m < 0 orelse m > n then raise Fail("Bad M")
  else if m=0 orelse m=n then 1
  else comb2(n-1,m) + comb2(n-1,m-1)
end;

fun comb1(n, m) =
let
  val nInt = valOf(Int.fromString(n)) handle Option => raise Fail("Non Int N")
  val mInt = valOf(Int.fromString(m)) handle Option => raise Fail("Non Int M")
  val answer = comb2(nInt, mInt)
in
  answer
end;

fun comb(_,[n,m]) =
  (
    print(Int.toString(comb1(n, m)));
    print("\n");
    OS.Process.success
  ) handle Fail(msg) => (
    print(msg);
    print("\n");
    OS.Process.failure
  );

