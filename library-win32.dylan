Module: dylan-user
Author: kibook

define library process-times
  use common-dylan;
  use win32-common;
  use win32-kernel;
  export
    process-times;
end library process-times;

define module process-times
  use common-dylan;
  use win32-common;
  use win32-kernel;
  export
    process-times,
    cpu-time;
end module process-times;
