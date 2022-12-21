cmake_minimum_required(VERSION 3.0)

# CMAKE FILES
include(cmake/config.cmake)
include(cmake/packages.cmake)
include(cmake/build.cmake)

# SUBMODULES
add_subdirectory(modules/gamedev-utils)

# PREREQUISITES
ConfigureTarget("gamedev")

# PROJECT
project(${TARGET} LANGUAGES CXX)
FindBuildAndInclude(
        ${TARGET} ""
        ${SOURCES} ${HEADERS}
        ${INCLUDE_DIR})
target_link_libraries(
        ${TARGET} PRIVATE
        utils
)