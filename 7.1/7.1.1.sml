(*
Exercise 7.1.1

Write expressions to do the following.

a) Define the type dino to be an abbreviation for a record structure with
fields name (a string), weight (a real), and height (a real).
*)

type dino = {
  name:   string,
  weight: real,
  height: real
};

(*
b) Create a record named tyranno, of type dino, that represents the facts
that Tyrannosaurus weighed 7 tons and was 20 feet tall.
*)

val tyranno = {
  name   = "tyranno",
  weight = 7.0,
  height = 20.0
};

(*
c) Create a record named brachio, of type dino, that represents the facts
that Brachiosaurus weighed 50 tons and was 40 feet tall.
*)

val brachio = {
  name   = "brachio",
  weight = 50.0,
  height = 40.0
};

(*
d) Write an expression that gets from the record tyranno the height of a
Tyrannosaurus.
*)

val tyrannoHeight = #height tyranno;

(*
e) Write an expression that gets from the record brachio the weight of a
Brachiosaurus.
*)

val brachioWeight = #weight brachio;

