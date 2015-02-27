Module: process-times
Synopsis: Generic process-times interface
Author: kibook
Version: 09-02-2015

define function cpu-time
    ()
 => (seconds :: <integer>, microseconds :: <integer>)

  let (u-sec, u-usec, s-sec, s-usec) = process-times();

  let seconds = u-sec + s-sec;
  let microseconds = u-usec + s-usec;

  values(seconds, microseconds)

end function cpu-time;
