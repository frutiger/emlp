(*
Exercise 6.2.8

In propositional logic, statements are represented by propositional variables,
which we may think of as identifiers. Logical expressions can be built from
propositional variables by applying a number of logical operators.  In our
exercise, we shall define logical expressions and their truth values in a simple
but useful form as follows.

BASIS: A propositional variable is a logical expression. Its truth value may be
assigned to be either true or false.

INDUCTION: If E1 and E2 are logical expressions, then

  1. AND(E1, E2) is a logical expression, and its value is true if and only if
     both E1 and E2 have the value true.

  2. OR(Ei,E2) is a logical expression, and its value is true if either E1 or E2
     or both have the value true.

  3. NOT(Ei) is a logical expression whose value is true if and only if the
     value of E1 is false.

An example of a propositional expression is AND(OR(p,q), NOT(p)). Do the
following:

a) Devise a datatype whose values represent logical expressions as described
   above. You may assume that propositional variables are represented by
   strings.
*)

datatype expr = Id  of string
              | And of (expr * expr)
              | Or  of (expr * expr)
              | Not of expr;

(*
b) Write a function eval(E,L) that takes a logical expression E and a list of
   true propositional variables L, and determines the truth value of E on the
   assumption that the propositional variables on L are true and all other
   propositional variables are false.
*)

fun exists(x, nil)   = false
  | exists(x, y::ys) = x=y orelse exists(x, ys);

fun eval(E, L) = case E
  of Id e1       => exists(e1, L)
   | And(e1, e2) => eval(e1, L) andalso eval(e2, L)
   | Or(e1, e2)  => eval(e1, L) orelse eval(e2, L)
   | Not e1      => not(eval(e1, L));

