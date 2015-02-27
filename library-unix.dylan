module: dylan-user

define library process-times
  use common-dylan;
  use c-ffi;
  export
    process-times;
end library process-times;

define module c-timeval
  use common-dylan;
  use c-ffi;
  export
    <c-timeval>,
      tv-sec, tv-sec-setter,
      tv-usec, tv-usec-setter,
    <c-timeval*>;
end module c-timeval;

define module c-rusage
  use common-dylan;
  use c-ffi;
  use c-timeval;
  export
    <c-rusage>,
      ru-utime, ru-utime-setter,
      ru-stime, ru-stime-setter,
      ru-maxrss, ru-maxrss-setter,
      ru-ixrss, ru-ixrss-setter,
      ru-idrss, ru-idrss-setter,
      ru-isrss, ru-isrss-setter,
      ru-minflt, ru-minflt-setter,
      ru-majflt, ru-majflt-setter,
      ru-nswap, ru-nswap-setter,
      ru-inblock, ru-inblock-setter,
      ru-oublock, ru-oublock-setter,
      ru-msgsnd, ru-msgsnd-setter,
      ru-msgrcv, ru-msgrcv-setter,
      ru-nsignals, ru-nsignals-setter,
      ru-nvcsw, ru-nvcsw-setter,
      ru-nivcsw, ru-nivcsw-setter,
    <c-rusage*>,
    $c-rusage-self,
    c-getrusage;
end module c-rusage;

define module process-times
  use common-dylan;
  use c-ffi;
  use c-timeval;
  use c-rusage;
  export
    process-times,
    cpu-time;
end module process-times;
