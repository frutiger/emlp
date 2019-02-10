(*
Exercise 9.2.1

Without using the if-then-else operator, write an expression equivalent to if
x>0.0 then x else 0.0.
*)

fun pos x = case x > 0.0
              of true  => x
               | false => 0.0;

