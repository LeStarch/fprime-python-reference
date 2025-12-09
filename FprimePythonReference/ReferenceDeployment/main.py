import sys
import os
sys.path.append(os.getcwd())
import fprime_python

if __name__ == "__main__":
    print("[INFO] Launch F Prime Woot!")
    topology_state = fprime_python.TopologyState()
    topology_state.hostname = "127.0.0.1"
    topology_state.port = 50000
    try:
        fprime_python.setupTopology(topology_state)
        fprime_python.startRateGroups()
    except Exception as e:
        print(f"[ERROR] Failed to start F Prime: {e}")
    fprime_python.teardownTopology()
    exit(0)
