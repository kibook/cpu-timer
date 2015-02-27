Module: process-times
Synopsis: Get CPU (user + system) time (UNIX)
Author: kibook
Version: 09-02-2015

define function process-times
    ()
 => (usr-time-sec :: <integer>, usr-time-usec :: <integer>,
     sys-time-sec :: <integer>, sys-time-usec :: <integer>)

  let usage :: <c-rusage*> = make(<c-rusage*>);

  c-getrusage($c-rusage-self, usage);

  let usr-time-sec :: <integer> = usage.ru-utime.tv-sec;
  let usr-time-usec :: <integer> = usage.ru-utime.tv-usec;
  let sys-time-sec :: <integer> = usage.ru-utime.tv-sec;
  let sys-time-usec :: <integer> = usage.ru-utime.tv-usec;

  destroy(usage);

  values(usr-time-sec, usr-time-usec, sys-time-sec, sys-time-usec)

end function process-times;
