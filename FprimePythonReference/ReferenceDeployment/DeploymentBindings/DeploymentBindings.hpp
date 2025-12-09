#include <pybind11/pybind11.h>

// These includes bring in the necessary types and functions for deployment
#include <FprimePythonReference/ReferenceDeployment/Top/ReferenceDeploymentTopology.hpp>

//! \brief bind the deployment bindings into Python
//!
//! This function initializes the Python bindings for the deployment. It must bind all functions needed to start F Prime
//! from within Python. This includes the topology setup/teardown functions typically called: `setupTopology` and
//! `teardownTopology`, the rate group start/stop functions typically called: `startRateGroups` and `stopRateGroups`,
//! and the TopologyState type passed into the topology setup function.
//!
//! Since all these functions and types are project-malleable, this function must be defined by the project.
void setup_user_deployment(pybind11::module_& m);