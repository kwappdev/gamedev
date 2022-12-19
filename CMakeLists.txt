# SETTINGS
cmake_minimum_required(VERSION 3.0)
set(CMAKE_CXX_STANDARD 20)

# PACKAGE MANAGER
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/modules/gamedev-utils/modules/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE PATH "vcpkg")
set(VCPKG_TARGET_TRIPLET "x64-windows" CACHE STRING "")

# PROJECT
add_subdirectory(modules/gamedev-utils)
set(TARGET gamedev)
project(${TARGET} LANGUAGES CXX)

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
