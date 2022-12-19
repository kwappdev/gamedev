# SETTINGS
cmake_minimum_required(VERSION 3.0)
set(CMAKE_CXX_STANDARD 20)

# PROJECT
set(TARGET gamedev)
project(${TARGET} LANGUAGES CXX)
add_subdirectory(modules/${TARGET}-utils)

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
