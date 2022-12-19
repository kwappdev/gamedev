# SETTINGS
cmake_minimum_required(VERSION 3.3)
set(CMAKE_CXX_STANDARD 20)

# PACKAGE MANAGER
set(VCPKG_TARGET_TRIPLET "x64-windows" CACHE STRING "")

# PROJECT
set(TARGET gamedev)
project(${TARGET} LANGUAGES CXX)

# PACKAGES
add_subdirectory(modules/gamedev-utils)

# CONSTANTS
set(INCLUDE_DIR include)

# FILES
file(GLOB_RECURSE SOURCES src/*.cpp)
file(GLOB_RECURSE HEADERS ${INCLUDE_DIR}/*.h)

# TARGET
add_executable(
        ${TARGET}
        ${SOURCES}
        ${HEADERS}
)

# MODULES
target_link_libraries(
        ${TARGET} PUBLIC
        utils
)

# INCLUDE
target_include_directories(
        ${TARGET} PUBLIC
        ${INCLUDE_DIR}
        $<INSTALL_INTERFACE:include>
)

# OPTIONS
target_compile_options(
        ${TARGET} PRIVATE
        -Wall -Wextra
)
