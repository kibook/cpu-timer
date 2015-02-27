*************************
The process-times library
*************************

.. current-library:: process-times


The process-times module
************************

.. current-module:: process-times


.. function:: cpu-time

   :signature: cpu-time () => (seconds microseconds)

   :value seconds: An instance of :class:`<integer>`.
   :value microseconds: An instance of :class:`<integer>`.

   Returns the current CPU execution time, which is equivalent to the
   user execution time + the system execution time.

.. function:: process-times

   :signature: process-times () => (usr-time-sec usr-time-usec sys-time-sec sys-time-usec)

   :value usr-time-sec: An instance of :class:`<integer>`.
   :value usr-time-usec: An instance of :class:`<integer>`.
   :value sys-time-sec: An instance of :class:`<integer>`.
   :value sys-time-usec: An instance of :class:`<integer>`.

   Returns the user and system execution times.
