module ReferenceDeployment {

  # ----------------------------------------------------------------------
  # Base ID Convention
  # ----------------------------------------------------------------------
  #
  # All Base IDs follow the 8-digit hex format: 0xDSSCCxxx
  #
  # Where:
  #   D   = Deployment digit (1 for this deployment)
  #   SS  = Subtopology digits (00 for main topology, 01-05 for subtopologies)
  #   CC  = Component digits (00, 01, 02, etc.)
  #   xxx = Reserved for internal component items (events, commands, telemetry)
  #

  # ----------------------------------------------------------------------
  # Defaults
  # ----------------------------------------------------------------------

  module Default {
    constant QUEUE_SIZE = 10
    constant STACK_SIZE = 64 * 1024
  }

  # ----------------------------------------------------------------------
  # Active component instances
  # ----------------------------------------------------------------------

  instance rateGroup1: Svc.ActiveRateGroup base id 0x10001000 \
    queue size Default.QUEUE_SIZE \
    stack size Default.STACK_SIZE \
    priority 43 \
    {
        phase Fpp.ToCpp.Phases.configObjects """
        U32 context[Svc::ActiveRateGroup::CONNECTION_COUNT_MAX] = {};
        """
        phase Fpp.ToCpp.Phases.configComponents """
        rateGroup1.configure(ConfigObjects::ReferenceDeployment_rateGroup1::context,
            FW_NUM_ARRAY_ELEMENTS(ConfigObjects::ReferenceDeployment_rateGroup1::context));
        """
    }
  
  instance rateGroup2: Svc.ActiveRateGroup base id 0x10002000 \
    queue size Default.QUEUE_SIZE \
    stack size Default.STACK_SIZE \
    priority 42 \
    {
        phase Fpp.ToCpp.Phases.configObjects """
        U32 context[Svc::ActiveRateGroup::CONNECTION_COUNT_MAX] = {};
        """
        phase Fpp.ToCpp.Phases.configComponents """
        rateGroup2.configure(ConfigObjects::ReferenceDeployment_rateGroup2::context,
            FW_NUM_ARRAY_ELEMENTS(ConfigObjects::ReferenceDeployment_rateGroup2::context));
        """
    }

  instance rateGroup3: Svc.ActiveRateGroup base id 0x10003000 \
    queue size Default.QUEUE_SIZE \
    stack size Default.STACK_SIZE \
    priority 41 \
    {
        phase Fpp.ToCpp.Phases.configObjects """
        U32 context[Svc::ActiveRateGroup::CONNECTION_COUNT_MAX] = {};
        """
        phase Fpp.ToCpp.Phases.configComponents """
        rateGroup3.configure(ConfigObjects::ReferenceDeployment_rateGroup3::context,
            FW_NUM_ARRAY_ELEMENTS(ConfigObjects::ReferenceDeployment_rateGroup3::context));
        """
    }

  instance cmdSeq: Svc.CmdSequencer base id 0x10004000 \
    queue size Default.QUEUE_SIZE \
    stack size Default.STACK_SIZE \
    priority 40 \
    {
        phase Fpp.ToCpp.Phases.configObjects """
        Fw::MallocAllocator mallocator;
        """
        phase Fpp.ToCpp.Phases.configComponents """
        cmdSeq.allocateBuffer(0, ConfigObjects::ReferenceDeployment_cmdSeq::mallocator, 5 * 1024);
        """
        phase Fpp.ToCpp.Phases.tearDownComponents """
        cmdSeq.deallocateBuffer(ConfigObjects::ReferenceDeployment_cmdSeq::mallocator);
        """
    }
  
  instance activeImager: FprimePythonReference.ActiveImager base id 0x10005000 \
    queue size Default.QUEUE_SIZE \
    stack size Default.STACK_SIZE \
    priority 95

  # ----------------------------------------------------------------------
  # Queued component instances
  # ----------------------------------------------------------------------

  instance pythonGc: FprimePythonReference.PythonGc base id 0x10009000 \
    queue size Default.QUEUE_SIZE 

  # ----------------------------------------------------------------------
  # Passive component instances
  # ----------------------------------------------------------------------

  instance chronoTime: Svc.ChronoTime base id 0x10010000

  instance rateGroupDriver: Svc.RateGroupDriver base id 0x10011000 \
  {
      phase Fpp.ToCpp.Phases.configObjects """
      Svc::RateGroupDriver::DividerSet rateGroupDivisorsSet{{{1, 0}, {2, 0}, {4, 0}}};
      """
      phase Fpp.ToCpp.Phases.configComponents """
      rateGroupDriver.configure(ConfigObjects::ReferenceDeployment_rateGroupDriver::rateGroupDivisorsSet);
      """
  }

  instance systemResources: Svc.SystemResources base id 0x10012000

  instance timer: FprimePython.PythonRateGroupDriver base id 0x10013000

  instance pythonCom: FprimePythonReference.PythonTcpCom base id 0x10014000
}
