Module: dylan-user
Author: kibook

define library cpu-timer
  use common-dylan;
  use process-times;
  export
    cpu-timer;
end library cpu-timer;

define module cpu-timer
  use common-dylan;
  use process-times;
  export
    <cpu-profiling-timer>,
      timer-running?,
      timer-start,
      timer-accumulated-time,
      timer-stop,
    cpu-timing;
end module cpu-timer;
