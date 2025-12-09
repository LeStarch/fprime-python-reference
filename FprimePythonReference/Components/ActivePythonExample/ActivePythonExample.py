import fprime_python
from ActivePythonExampleBaseAc import ActivePythonExampleBase


class ActivePythonExample(ActivePythonExampleBase):
    def pythonInReturnPort_handler(self, portNum):
        """ Handle the pythonInReturnPort port """
        pass
    def pythonInPort_handler(self, portNum, arg1, arg2):
        """ Handle the pythonInPort port """
        pass
    def STRING_COMMAND_cmdHandler(self, opCode, cmdSeq, string_argument):
        """ Handle the STRING_COMMAND command """
        self.cmdResponse_out(opCode, cmdSeq, fprime_python.Fw.CmdResponse(fprime_python.Fw.CmdResponse.T.OK))
    def TYPES_COMMAND_cmdHandler(self, opCode, cmdSeq, enum_argument, struct_argument):
        """ Handle the TYPES_COMMAND command """
        self.cmdResponse_out(opCode, cmdSeq, fprime_python.Fw.CmdResponse(fprime_python.Fw.CmdResponse.T.OK))