module FprimePythonReference {
    @ A passive component implemented in Python
    @ fprime-python 
    passive component PythonTcpCom {
        import Svc.Com

        @ Track that a python reference was tracked in F Prime
        output port referenceTracked: Fw.Signal

        @ Track that a python reference was untracked in F Prime
        output port referenceUntracked: Fw.Signal

        ###############################################################################
        # Standard AC Ports: Required for Channels, Events, Commands, and Parameters  #
        ###############################################################################
        @ Port for requesting the current time
        time get port timeCaller

        @ Port for sending textual representation of events
        text event port logTextOut

        @ Port for sending events to downlink
        event port logOut

        @ Port for sending telemetry channels to downlink
        telemetry port tlmOut
    }
}
