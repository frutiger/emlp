(*
Exercise 4.2.5

Design the following calendar-printing function.  Take as input a month, the day
of the first of that month, and the number of days in the month.  Months and
days are abbreviated by their first three letters.  The month, day and number of
days are each separated by a single white-space character.  For example, a
request to print the calendar for a September in which the first of the month is
on a Thursday would be

    Sep Thu 30

Print the calendar as:

  1. A row with the month (full name) indented by three tabs.

  2. A blank row.

  3. A row with the names of the days (three-letter abbreviations) separated by
  tabs.

  4. As many rows as necessary, with the days printed in the proper columns.

For example, Fig 4.8 shows the calendar desired for September when Sept. 1 falls
on a Thursday.

Fig. 4.8 is reproduced below.

                            September

    Sun     Mon     Tue     Wed     Thu     Fri     Sat

                                     1       2       3
     4       5       6       7       8       9      10
     11      12      13      14     15      16      17
     18      19      20      21     22      23      24
     25      26      27      28     29      30

*)

fun printTabs(1) = print("\t")
  | printTabs(n) = (print("\t"); printTabs(n-1));

fun printNewline() = print("\n");

fun printMonth("Jan") = print("January")
  | printMonth("Feb") = print("February")
  | printMonth("Mar") = print("March")
  | printMonth("Apr") = print("April")
  | printMonth("May") = print("May")
  | printMonth("Jun") = print("June")
  | printMonth("Jul") = print("July")
  | printMonth("Aug") = print("August")
  | printMonth("Sep") = print("September")
  | printMonth("Oct") = print("October")
  | printMonth("Nov") = print("November")
  | printMonth("Dec") = print("December");

fun printTabbed(value) = (
  print(value);
  printTabs(1)
);

fun printDays() = (
  printTabbed("Sun");
  printTabbed("Mon");
  printTabbed("Tue");
  printTabbed("Wed");
  printTabbed("Thu");
  printTabbed("Fri");
  printTabbed("Sat")
);

fun dayOffset("Sun") = 0
  | dayOffset("Mon") = 1
  | dayOffset("Tue") = 2
  | dayOffset("Wed") = 3
  | dayOffset("Thu") = 4
  | dayOffset("Fri") = 5
  | dayOffset("Sat") = 6;

fun printDates(current, 0, offset) = ()
  | printDates(current, length, offset) = (
  if offset mod 7 = 0 then printNewline() else ();
  let
    val date = current + 1
  in
    if date < 10 then print(" ") else ();
    printTabbed(Int.toString(date))
  end;
  printDates(current+1, length-1, offset+1)
);

fun printCal(month, day, length) = (
  printTabs(3);
  printMonth(month); printNewline(); printNewline();
  printDays();       printNewline(); printNewline();
  let
    val offset = dayOffset(day)
  in (
    printTabs(offset);
    printDates(0, length, offset)
  ) end; printNewline()
);

