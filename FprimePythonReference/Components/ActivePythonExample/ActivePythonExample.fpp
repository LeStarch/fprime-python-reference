module FprimePythonReference {
    @ An active component implemented in Python
    @ fprime-python
    active component ActivePythonExample {

        @ String command test
        async command STRING_COMMAND(string_argument: string)

        @ Enumeration and struct command test
        async command TYPES_COMMAND(enum_argument: PythonEnumeration, struct_argument: PythonComplexStruct)

        async input port pythonInPort: PythonPort

        sync input port pythonInReturnPort: PythonReturnPort

        output port pythonOutPort: PythonPort
        
        output port pythonOutReturnPort: PythonReturnPort
        
        event PythonEvent(enum_argument: PythonEnumeration,
                          struct_argument: PythonComplexStruct
                         ) \
            severity activity high \
            format "Event with {}, {}"

        telemetry PythonChannel: PythonEnumeration update on change

        param PYTHON_PARAM: PythonEnumeration default PythonEnumeration.ENUMERATION_A

        param PYTHON_ARRAY_PARAM: PythonArray default [1.0, 2.0, 3.0]

        param PYTHON_STRUCT_PARAM: PythonComplexStruct default {
            u =  {a = 42, b = 3.14},
            w =  [1.0, 2.0, 3.0],
            x = 7,
            y = "Hello",
            z = PythonEnumeration.ENUMERATION_B
        }


        ###############################################################################
        # Standard AC Ports: Required for Channels, Events, Commands, and Parameters  #
        ###############################################################################
        @ Port for requesting the current time
        time get port timeCaller

        @ Port for sending command registrations
        command reg port cmdRegOut

        @ Port for receiving commands
        command recv port cmdIn

        @ Port for sending command responses
        command resp port cmdResponseOut

        @ Port for sending textual representation of events
        text event port logTextOut

        @ Port for sending events to downlink
        event port logOut

        @ Port for sending telemetry channels to downlink
        telemetry port tlmOut

        @ Port to return the value of a parameter
        param get port prmGetOut

        @Port to set the value of a parameter
        param set port prmSetOut

    }
}
