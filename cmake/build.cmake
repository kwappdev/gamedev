# FIND PACKAGES, BUILD THE TARGET AND SPECIFY INCLUDE DIRETORIES
macro(FindBuildAndInclude target packages sources headers dir)
    foreach(PACKAGE ${packages})
        find_package(
                ${PACKAGE} CONFIG REQUIRED
                PATHS "${CMAKE_CURRENT_BINARY_DIR}/${VCPKG_TARGET_TRIPLET}"
        )
    endforeach()
    add_library(${target} STATIC ${sources} ${headers})
    target_include_directories(${target} PUBLIC ${dir} $<INSTALL_INTERFACE:include>)
    target_compile_options(${target} PRIVATE -Wall -Wextra)
endmacro()
