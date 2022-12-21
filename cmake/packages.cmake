# PACKAGE MANAGER
macro(Install vcpkg vcpkg_exe vcpkg_boot triplet)
    set(VCPKG_TARGET_TRIPLET "${triplet}" CACHE PATH "install dir")
    execute_process(
            COMMAND "${vcpkg}/bootstrap-vcpkg.${vcpkg_boot}"
            WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
            RESULT_VARIABLE RESULT
    )
    execute_process(
            COMMAND "${vcpkg}/vcpkg.${vcpkg_exe}" "install"
            "--x-manifest-root=${CMAKE_CURRENT_LIST_DIR}"
            "--x-install-root=${CMAKE_CURRENT_BINARY_DIR}"
            "--triplet" "${triplet}"
            WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
            RESULT_VARIABLE RESULT
    )
    message(STATUS ${RESULT})
endmacro()

# INSTALL PACKAGES
macro(InstallPlatformPackages vcpkg)
    if (WIN32)
        Install(${vcpkg} "exe" "bat" "x64-windows")
    elseif(APPLE)
        Install(${vcpkg} "sh" "sh" "x64-osx")
    elseif(UNIX)
        Install(${vcpkg} "sh" "sh" "x64-linux")
    endif ()
endmacro()