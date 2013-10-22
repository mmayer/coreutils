[NAME]
date \- print or set the system date and time
[DESCRIPTION]
.\" Add any additional description here
[DATE STRING]
.\" NOTE: keep this paragraph in sync with the one in touch.x
The --date=STRING is a mostly free format human readable date string
such as "Sun, 29 Feb 2004 16:21:42 -0800" or "2004-02-29 16:21:42" or
even "next Thursday".  A date string may contain items indicating
calendar date, time of day, time zone, day of week, relative time,
relative date, and numbers.  An empty string indicates the beginning
of the day.  The date string format is more complex than is easily
documented here but is fully described in the info documentation.
[VARITY STRING]
Adjust (i.e., take the current date and display the result of the
adjustment; not actually set the date) the second, minute, hour,
month day, week day, month or year according to val.  If val is
preceded with a plus or minus sign, the date is adjusted forwards
or backwards according to the remaining string, otherwise the
relevant part of the date is set.  The date can be adjusted as
many times as required using these flags.  Flags are processed in
the order given.

When setting values (rather than adjusting them), seconds are in
the range 0-59, minutes are in the range 0-59, hours are in the
range 0-23, month days are in the range 1-31, week days are in
the range 0-6 (Sun-Sat), months are in the range 1-12 (Jan-Dec)
and years are in the range 80-38 or 1980-2038.

If val is numeric, one of either y, m, w, d, H, M or S must be
used to specify which part of the date is to be adjusted.

The week day or month may be specified using a name rather than a
number.  If a name is used with the plus (or minus) sign, the
date will be put forwards (or backwards) to the next (previous)
date that matches the given week day or month.  This will not
adjust the date, if the given week day or month is the same as
the current one.

When a date is adjusted to a specific value or in units greater
than hours, daylight savings time considerations are ignored.
Adjustments in units of hours or less honor daylight saving time.
So, assuming the current date is March 26, 0:30 and that the DST
adjustment means that the clock goes forward at 01:00 to 02:00,
using -v +1H will adjust the date to March 26, 2:30.  Likewise,
if the date is October 29, 0:30 and the DST adjustment means that
the clock goes back at 02:00 to 01:00, using -v +3H will be nec-
essary to reach October 29, 2:30.

When the date is adjusted to a specific value that does not actu-
ally exist (for example March 26, 1:30 BST 2000 in the
Europe/London timezone), the date will be silently adjusted for-
wards in units of one hour until it reaches a valid time.  When
the date is adjusted to a specific value that occurs twice (for
example October 29, 1:30 2000), the resulting timezone will be
set so that the date matches the earlier of the two times.

It is not possible to adjust a date to an invalid absolute day,
so using the switches -v 31d -v 12m will simply fail five months
of the year.  It is therefore usual to set the month before set-
ting the day; using -v 12m -v 31d always works.

Adjusting the date by months is inherently ambiguous because a
month is a unit of variable length depending on the current date.
This kind of date adjustment is applied in the most intuitive
way.  First of all, date tries to preserve the day of the month.
If it is impossible because the target month is shorter than the
present one, the last day of the target month will be the result.
For example, using -v +1m on May 31 will adjust the date to June
30, while using the same option on January 30 will result in the
date adjusted to the last day of February.  This approach is also
believed to make the most sense for shell scripting.  Neverthe-
less, be aware that going forth and back by the same number of
months may take you to a different date.
