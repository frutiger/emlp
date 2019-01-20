(*
Exercise 7.1.2

Write the following functions based on the dino record type
of Exercise 7.1.1.

The dino record type is reproduced below:
*)
type dino = {
  name:   string,
  weight: real,
  height: real
};
(*
a) Given a list of dino records, find the tallest dinosaur on the list.
*)

val tallestDino = foldl
                  (fn (dino:dino, tallest) =>
                      if (#height dino) > (#height tallest)
                      then dino
                      else tallest)
                  {name = "", weight = 0.0, height = 0.0};

(*
b) Find the heaviest dinosaur on a list of dino records.
*)

val heaviestDino = foldl
                  (fn (dino:dino, heaviest) =>
                      if (#weight dino) > (#weight heaviest)
                      then dino
                      else heaviest)
                  {name = "", weight = 0.0, height = 0.0};

(*
c) Find the average weight of dinosaurs on a list of dino records.
*)

fun averageWeight(L) = foldl Real.+ 0.0 (map (fn dino:dino => #weight dino) L)
                       / Real.fromInt(List.length(L));

