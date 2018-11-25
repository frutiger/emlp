(*
Exercise 5.6.3

Since the function comp of Fig. 5.20 was written in Curried form, we can bind
the first argument F to a function to get a new function that takes a function
G as argument and produces the function G o F. However, if we write an
expression such as

  val I = comp (fn x => x+3);

we get an error message saying there is a "nongeneralizable type variable,"
namely the unknown type that is the range type for I and the function to which
I will be applied.

Fig. 5.20 is reproduced below:
*)

fun comp F G =
  let
    fun C x = G(F(x))
  in
    C
  end;

(*
a) We can fix the definition of I above if we give it a type. If we want the
   range type of I to be string, what is a suitable type declaration to add
   to the definition of I?
*)

   val I : (int -> string) -> int -> string = comp (fn x => x + 3);

(*
b) Having defined I as in part (a), show how to use I to create a function
   that given an integer x returns a string consisting of the digits of x + 3.
*)

  val J = I Int.toString;

(*
c) Use your answer to (b) to create a function that, given an integer x prints
   x + 3.
*)

  fun K x = (print(J x); print("\n"));

