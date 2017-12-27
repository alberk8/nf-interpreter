#
# Copyright (c) 2017 The nanoFramework project contributors
# See LICENSE file in the project root for full license information.
#

# native code directory
set(BASE_PATH_FOR_THIS_MODULE "${BASE_PATH_FOR_CLASS_LIBRARIES_MODULES}/Windows.Devices.I2c")


# set include directories
list(APPEND Windows.Devices.I2c_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/src/CLR/Core")
list(APPEND Windows.Devices.I2c_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/src/CLR/Include")
list(APPEND Windows.Devices.I2c_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/src/HAL/Include")
list(APPEND Windows.Devices.I2c_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/src/PAL/Include")
list(APPEND Windows.Devices.I2c_INCLUDE_DIRS "${BASE_PATH_FOR_THIS_MODULE}")


# source files
set(Windows.Devices.I2c_SRCS

    win_dev_i2c_native.cpp
    win_dev_i2c_native.h
    win_dev_i2c_native_Windows_Devices_I2C_I2cDevice.cpp
)

foreach(SRC_FILE ${Windows.Devices.I2c_SRCS})
    set(Windows.Devices.I2c_SRC_FILE SRC_FILE-NOTFOUND)
    find_file(Windows.Devices.I2c_SRC_FILE ${SRC_FILE}
        PATHS 
            "${BASE_PATH_FOR_THIS_MODULE}"

        CMAKE_FIND_ROOT_PATH_BOTH
    )
    # message("${SRC_FILE} >> ${Windows.Devices.I2c_SRC_FILE}") # debug helper
    list(APPEND Windows.Devices.I2c_SOURCES ${Windows.Devices.I2c_SRC_FILE})
endforeach()


include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(NF_Debugger DEFAULT_MSG Windows.Devices.I2c_INCLUDE_DIRS Windows.Devices.I2c_SOURCES)
