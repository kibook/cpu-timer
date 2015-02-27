Module: c-timeval
Synopsis: C struct timeval
Author: kibook
Version: 09-02-2015

define c-struct <c-timeval>
  slot tv-sec :: <c-long>;
  slot tv-usec :: <c-long>;
  pointer-type-name: <c-timeval*>;
end c-struct <c-timeval>;
