# Install script for directory: /home/nvidia/sdc-ernie/src/racecar/reflexive_control

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/nvidia/sdc-ernie/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/nvidia/sdc-ernie/build/racecar/reflexive_control/catkin_generated/installspace/reflexive_control.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/reflexive_control/cmake" TYPE FILE FILES
    "/home/nvidia/sdc-ernie/build/racecar/reflexive_control/catkin_generated/installspace/reflexive_controlConfig.cmake"
    "/home/nvidia/sdc-ernie/build/racecar/reflexive_control/catkin_generated/installspace/reflexive_controlConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/reflexive_control" TYPE FILE FILES "/home/nvidia/sdc-ernie/src/racecar/reflexive_control/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/reflexive_control" TYPE PROGRAM FILES
    "/home/nvidia/sdc-ernie/src/racecar/reflexive_control/scripts/scan_parser.py"
    "/home/nvidia/sdc-ernie/src/racecar/reflexive_control/scripts/wall_detector.py"
    "/home/nvidia/sdc-ernie/src/racecar/reflexive_control/scripts/object_detector.py"
    "/home/nvidia/sdc-ernie/src/racecar/reflexive_control/scripts/driver.py"
    "/home/nvidia/sdc-ernie/src/racecar/reflexive_control/scripts/dumb_driver.py"
    "/home/nvidia/sdc-ernie/src/racecar/reflexive_control/scripts/driver_test.py"
    )
endif()

