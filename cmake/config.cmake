# CONFIGURATION
macro(ConfigureTarget target)
    # CONFIG
    set(CMAKE_CXX_STANDARD 20)

    # CONSTANTS
    set(TARGET ${target})
    set(SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/src)
    set(INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/include)
    set(VCPKG_ROOT ${CMAKE_CURRENT_LIST_DIR}/modules/vcpkg CACHE PATH "vcpkg root")

    # FILES
    file(GLOB_RECURSE SOURCES ${SOURCE_DIR}/*.cpp)
    file(GLOB_RECURSE HEADERS ${INCLUDE_DIR}/*.h)
endmacro()
