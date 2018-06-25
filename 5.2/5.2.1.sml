(*
Exercise 5.2.1

Write a function to return the third element of a list.  Define suitable
exceptions to tell what is wrong in the cases that the response of the function
is not defined.  Raise the appropriate exception in response to erroneous
inputs.
*)

exception ListTooShort;

fun thirdElem(_::_::x3::_) = x3
  | thirdElem(_)           = raise ListTooShort;

