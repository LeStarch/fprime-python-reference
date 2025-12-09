#####
# 'ReferenceDeployment' Deployment:
#
# This registers the 'ReferenceDeployment' deployment to the build system. 
# Custom components that have not been added at the project-level should be added to 
# the list below.
#
#####

register_fprime_library(
    SOURCES
        "${CMAKE_CURRENT_LIST_DIR}/DeploymentBindings.cpp"
    DEPENDS
        FprimePythonReference_ReferenceDeployment_Top
)
# Add include directory to here, so that the designated include name "DeploymentBindings.hpp" is available.
target_include_directories(${FPRIME_CURRENT_MODULE} PUBLIC "${CMAKE_CURRENT_LIST_DIR}")
