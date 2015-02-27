Module: process-times
Synopsis: Get CPU (user + system) time (WIN32)
Author: kibook
Version: 09-02-2015

define function file-time-to-millis
    (file-time :: <LPFILETIME>)
 => (millis :: <integer>)

  let s :: <LPSYSTEMTIME> = make(<LPSYSTEMTIME>);
  FileTimeToSystemTime(file-time, s);
  
  let millis = s.wHour-value * 3600000
             + s.wMinute-value * 60000
             + s.wSecond-value *  1000
             + s.wMilliseconds-value;

  destroy(s);

  millis

end function file-time-to-millis;

define function process-times
    ()
 => (usr-time-sec :: <integer>, usr-time-usec :: <integer>,
     sys-time-sec :: <integer>, sys-time-usec :: <integer>)

  let creation-time :: <LPFILETIME> = make(<LPFILETIME>);
  let exit-time :: <LPFILETIME> = make(<LPFILETIME>);
  let kernel-time :: <LPFILETIME> = make(<LPFILETIME>);
  let user-time :: <LPFILETIME> = make(<LPFILETIME>);

  GetProcessTimes(application-instance-handle(),
                  creation-time,
                  exit-time,
                  kernel-time,
                  user-time);

  let usr-ms :: <integer> = file-time-to-millis(user-time);
  let sys-ms :: <integer> = file-time-to-millis(kernel-time);

  destroy(creation-time);
  destroy(exit-time);
  destroy(kernel-time);
  destroy(user-time);

  let usr-time-sec :: <integer> = floor/(usr-ms, 1000);
  let usr-time-usec :: <integer> = modulo(usr-ms, 1000) * 1000;
  let sys-time-sec :: <integer> = floor/(sys-ms, 1000);
  let sys-time-usec :: <integer> = modulo(sys-ms, 1000) * 1000;

  values(usr-time-sec, usr-time-usec, sys-time-sec, sys-time-usec)

end function process-times;
