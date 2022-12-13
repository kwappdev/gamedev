# SETTINGS
cmake_minimum_required(VERSION 3.0)
set(CMAKE_CXX_STANDARD 20)

# PROJECT
set(TARGET gamedev)
add_subdirectory(${TARGET}-utils)
project(${TARGET} LANGUAGES CXX)

# FILES
file(GLOB_RECURSE SOURCES src/*.cpp)
file(GLOB_RECURSE HEADERS src/*.h)

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
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

# OPTIONS
target_compile_options(
        ${TARGET} PRIVATE
        -Wall -Wextra
)
