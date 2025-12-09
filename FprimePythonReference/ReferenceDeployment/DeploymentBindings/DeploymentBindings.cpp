#include "DeploymentBindings.hpp"

// Function used to bind the deployment into Python
void setup_user_deployment(pybind11::module_& m) {
    // Bind in the topology state type
    pybind11::class_<ReferenceDeployment::TopologyState>(m, "TopologyState")
        .def(pybind11::init<>())
        .def_readwrite("hostname", &ReferenceDeployment::TopologyState::hostname)
        .def_readwrite("port", &ReferenceDeployment::TopologyState::port);
    // Bind in the deployment functions
    m.def("setupTopology", &ReferenceDeployment::setupTopology, pybind11::arg("state"), pybind11::call_guard<pybind11::gil_scoped_release>());
    m.def("teardownTopology", &ReferenceDeployment::teardownTopology, pybind11::call_guard<pybind11::gil_scoped_release>());
    m.def("startRateGroups", &ReferenceDeployment::startRateGroups, pybind11::arg("interval") = Fw::TimeInterval(1,0), pybind11::call_guard<pybind11::gil_scoped_release>());
}