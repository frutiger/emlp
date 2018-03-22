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

open TextIO;

fun outputTabs(f, 1) = output1(f, #"\t")
  | outputTabs(f, n) = (output1(f, #"\t"); outputTabs(f, n-1));

fun outputNewline(f) = output1(f, #"\n");

fun outputMonth(f, "Jan") = output(f, "January")
  | outputMonth(f, "Feb") = output(f, "February")
  | outputMonth(f, "Mar") = output(f, "March")
  | outputMonth(f, "Apr") = output(f, "April")
  | outputMonth(f, "May") = output(f, "May")
  | outputMonth(f, "Jun") = output(f, "June")
  | outputMonth(f, "Jul") = output(f, "July")
  | outputMonth(f, "Aug") = output(f, "August")
  | outputMonth(f, "Sep") = output(f, "September")
  | outputMonth(f, "Oct") = output(f, "October")
  | outputMonth(f, "Nov") = output(f, "November")
  | outputMonth(f, "Dec") = output(f, "December");

fun outputTabbed(f, value) = (
  output(f, value);
  outputTabs(f, 1)
);

fun outputDays(f) = (
  outputTabbed(f, "Sun");
  outputTabbed(f, "Mon");
  outputTabbed(f, "Tue");
  outputTabbed(f, "Wed");
  outputTabbed(f, "Thu");
  outputTabbed(f, "Fri");
  outputTabbed(f, "Sat")
);

fun dayOffset("Sun") = 0
  | dayOffset("Mon") = 1
  | dayOffset("Tue") = 2
  | dayOffset("Wed") = 3
  | dayOffset("Thu") = 4
  | dayOffset("Fri") = 5
  | dayOffset("Sat") = 6;

fun outputDates(f, current, 0, offset) = ()
  | outputDates(f, current, length, offset) = (
  if offset mod 7 = 0 then outputNewline(f) else ();
  let
    val date = current + 1
  in
    if date < 10 then output1(f, #" ") else ();
    outputTabbed(f, Int.toString(date))
  end;
  outputDates(f, current+1, length-1, offset+1)
);

fun outputCal(f, month, day, length) = (
  outputTabs(f, 3);
  outputMonth(f, month); outputNewline(f); outputNewline(f);
  outputDays(f);         outputNewline(f); outputNewline(f);
  let
    val offset = dayOffset(day)
  in (
    outputTabs(f, offset);
    outputDates(f, 0, length, offset)
  ) end; outputNewline(f)
);

fun printCal(month, day, length) = outputCal(stdOut, month, day, length);

