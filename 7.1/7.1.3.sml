(*
Exercise 7.1.3

Suppose we have a list L of items with the record structure introduced in
Example 7.1.

This record structure is reproduced below:
*)
type student = {
  ID:      int,
  courses: string list,
  name:    string
};
(*
We can write several functions to search for records with given
properties. Write the following functions:

a) Given a list L and a name n, find all those records with n as the value of
its name field.
*)

fun matchName (L:student list) n = List.filter (fn {name, ...} => n=name) L;

(*
b) Given a list L and an ID i, find the list of courses in the first (and
presumably only) record with ID field equal to i.
*)

fun coursesForID (L:student list) id = case
  List.find (fn {ID, ...} => ID=id) L
    of SOME {courses, ...} => courses
     | NONE                => [];

(*
c) Given a list L and a course c, find the names of all the students who are
taking course c.
*)

fun studentsForCourse (L:student list) course =
  List.map (fn s => #name s)
           (List.filter
            (fn {courses, ...} => (List.exists (fn x => x=course)
            courses))
           L);
