""" ActivePythonExample Python component implementation

This is the Python implementation for the ActivePythonExample component. This class extends the auto-coded python base
class ActivePythonExampleBase that provides the necessary plumbing to connect to the C++ stub connected to the rest of
the F Prime topology.
"""
import fprime_py
from ActivePythonExampleBaseAc import ActivePythonExampleBase


class ActivePythonExample(ActivePythonExampleBase):
    """ Python implementation for the ActivePythonExample component """
    def pythonInReturnPort_handler(self, portNum):
        """ Handle the pythonInReturnPort port """
        # TODO: Implement port handler
        pass
    def pythonInPort_handler(self, portNum, arg1, arg2):
        """ Handle the pythonInPort port """
        # TODO: Implement port handler
        pass
    def STRING_COMMAND_cmdHandler(self, opCode, cmdSeq, string_argument):
        """ Handle the STRING_COMMAND command """
        print(f"[INFO] STRING_COMMAND received with argument: {string_argument}")
        self.cmdResponse_out(opCode, cmdSeq, fprime_py.Fw.CmdResponse(fprime_py.Fw.CmdResponse.T.OK))

    def TYPES_COMMAND_cmdHandler(self, opCode, cmdSeq, enum_argument, struct_argument):
        """ Handle the TYPES_COMMAND command """
        self.cmdResponse_out(opCode, cmdSeq, fprime_py.Fw.CmdResponse(fprime_py.Fw.CmdResponse.T.OK))