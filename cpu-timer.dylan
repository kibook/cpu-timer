Module: cpu-timer
Synopsis: A timer that uses CPU (user + system) time
Author: kibook
Version: 09-02-2015

define class <cpu-profiling-timer> (<object>)
  slot timer-running? :: <boolean> = #f;
  slot timer-started-seconds :: <integer>;
  slot timer-started-microseconds :: <integer>;
end class <cpu-profiling-timer>;

define method timer-start
    (timer :: <cpu-profiling-timer>)
 => ()

  let (sec, usec) = cpu-time();
  timer.timer-started-seconds := sec;
  timer.timer-started-microseconds := usec;
  timer.timer-running? := #t;

end method timer-start;

define method timer-accumulated-time
    (timer :: <cpu-profiling-timer>)
 => (seconds :: <integer>, microseconds :: <integer>)

  if (timer.timer-running?)
    let (sec, usec) = cpu-time();
    values(sec - timer.timer-started-seconds,
           usec - timer.timer-started-microseconds)
  else
    values(0, 0)
  end if

end method timer-accumulated-time;

define method timer-stop
    (timer :: <cpu-profiling-timer>)
 => (seconds :: <integer>, microseconds :: <integer>)

  if (timer.timer-running?)
    let (sec, usec) = timer.timer-accumulated-time;
    timer.timer-running? := #f;
    values(sec, usec)
  else
    values(0, 0)
  end if

end method timer-stop;

define macro cpu-timing
    { cpu-timing () ?:body end }
 => { let timer = make(<cpu-profiling-timer>);
      timer-start(timer);
      ?body;
      timer-stop(timer) }
end macro cpu-timing;
