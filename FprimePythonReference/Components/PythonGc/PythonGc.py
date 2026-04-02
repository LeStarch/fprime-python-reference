""" PythonGc Python component implementation

This is the Python implementation for the PythonGc component. This class extends the auto-coded python base
class PythonGcBase that provides the necessary plumbing to connect to the C++ stub connected to the rest of
the F Prime topology.
"""
import gc
import fprime_py
from PythonGcBaseAc import PythonGcBase


class PythonGc(PythonGcBase):
    """ Python implementation for the PythonGc component """
    def __init__(self):
        """ Construct the component
        
        The component is constructed during the "init" phase when the component is originally called. During this phase
        the F Prime topology is not yet fully constructed, so only basic initialization should be done here.
        """
        super().__init__()
        self.outstanding_reference_count = 0

    def run_handler(self, portNum, context):
        """ Handle the run port """
        
        # First, dispatch all outstanding messages
        status = self.dispatchAvailableMessages()
        if status == fprime_py.Fw.MsgDispatchStatus.MSG_DISPATCH_EXIT:
            return

        # Next, run the garbage collector
        gc.collect()

        # Finally, telemeter out telemetry counts
        self.tlmWrite_HeldReferences(self.outstanding_reference_count)
        self.tlmWrite_TrackedObjects(len(gc.get_objects()))


    def referenceUntracked_handler(self, portNum):
        """ Handle the referenceUntracked port """
        self.outstanding_reference_count -= 1
    
    def referenceTracked_handler(self, portNum):
        """ Handle the referenceTracked port """
        self.outstanding_reference_count += 1    