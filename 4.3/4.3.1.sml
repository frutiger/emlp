(*
Exercise 4.3.1

Write functions that will do the following.

(a) Open file 'baz' for writing *)
fun a() = openOut("baz"); (*

(b) Open file '/usr/spool/mail/fred' for appending *)
fun b() = openAppend("/usr/spool/mail/fred"); (*

(c) Close the file whose outstream if 'out1' *)
fun c() = closeOut(out1); (*

(d) Write the string 'super' to the outstream 'out2' *)
fun d() = output(out2, "super");

