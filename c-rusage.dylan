Module: c-rusage
Author: kibook
Synopsis: C struct rusage and getrusage interface
Version: 09-02-2015

define c-struct <c-rusage>
  slot ru-utime :: <c-timeval>;
  slot ru-stime :: <c-timeval>;
  slot ru-maxrss :: <c-long>;
  slot ru-ixrss :: <c-long>;
  slot ru-idrss :: <c-long>;
  slot ru-isrss :: <c-long>;
  slot ru-minflt :: <c-long>;
  slot ru-majflt :: <c-long>;
  slot ru-nswap :: <c-long>;
  slot ru-inblock :: <c-long>;
  slot ru-oublock :: <c-long>;
  slot ru-msgsnd :: <c-long>;
  slot ru-msgrcv :: <c-long>;
  slot ru-nsignals :: <c-long>;
  slot ru-nvcsw :: <c-long>;
  slot ru-nivcsw :: <c-long>;
  pointer-type-name: <c-rusage*>;
end c-struct <c-rusage>;

define constant $c-rusage-self = 0;

define c-function c-getrusage
  parameter who :: <c-int>;
  parameter usage :: <c-rusage*>;
  result getrusage :: <c-int>;
  c-name: "getrusage";
end c-function c-getrusage;
