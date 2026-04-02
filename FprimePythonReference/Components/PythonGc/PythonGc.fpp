module FprimePythonReference {
    @ Telemeters garbage collector statistics
    @ fprime-python
    queued component PythonGc {
        @ Rate-group driven run port used to process allocation and deallocation requests, force gc, and telemeter
        sync input port run: Svc.Sched
        
        @ Track that a python reference was tracked in F Prime
        async input port referenceTracked: Fw.Signal

        @ Track that a python reference was untracked in F Prime
        async input port referenceUntracked: Fw.Signal

        @ Count of currently tracked python references
        telemetry HeldReferences: FwSizeType

        @ Count of GC tracked objects
        telemetry TrackedObjects: FwSizeType

        ###############################################################################
        # Standard AC Ports: Required for Channels, Events, Commands, and Parameters  #
        ###############################################################################
        @ Port for requesting the current time
        time get port timeCaller

        @ Enables telemetry channels handling
        import Fw.Channel

    }
}