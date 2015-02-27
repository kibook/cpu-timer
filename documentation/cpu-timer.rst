*********************
The cpu-timer library
*********************

.. current-library:: cpu-timer


The cpu-timer module
********************

.. current-module:: cpu-timer


.. class:: <cpu-profiling-timer>

   :superclasses: :class:`<object>`

   A profiling timer which uses the CPU time of the current process rather
   than wall-clock (real) time.


.. macro:: cpu-timing

.. code-block:: dylan

   let (seconds, microseconds)
     = cpu-timing ()
         // code to time
       end cpu-timing;

   format-out("Code took %d seconds and %d microseconds to execute.",
              seconds, microseconds);

.. method:: timer-accumulated-time
   :specializer: <cpu-profiling-timer>

   Returns the time since the timer was started.

   :signature: timer-accumulated-time (timer) => (seconds microseconds)

   :parameter timer: An instance of :class:`<cpu-profiling-timer>`.
   :value seconds: An instance of :class:`<integer>`.
   :value microseconds: An instance of :class:`<integer>`.

.. method:: timer-running?
   :specializer: <cpu-profiling-timer>

   Returns true if the timer is running.

   :signature: timer-running? (object) => (value)

   :parameter object: An instance of ``{<cpu-profiling-timer> in cpu-timer}``.
   :value value: An instance of :class:`<boolean>`.

.. method:: timer-start
   :specializer: <cpu-profiling-timer>

   :signature: timer-start (timer) => ()

   :parameter timer: An instance of :class:`<cpu-profiling-timer>`.

.. method:: timer-stop
   :specializer: <cpu-profiling-timer>

   Stops a timer and returns the elapsed time.

   :signature: timer-stop (timer) => (seconds microseconds)

   :parameter timer: An instance of :class:`<cpu-profiling-timer>`.
   :value seconds: An instance of :class:`<integer>`.
   :value microseconds: An instance of :class:`<integer>`.
