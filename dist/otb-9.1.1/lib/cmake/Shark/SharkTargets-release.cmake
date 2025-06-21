#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "shark" for configuration "Release"
set_property(TARGET shark APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(shark PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libshark.so.3.1.0"
  IMPORTED_SONAME_RELEASE "libshark.so.0"
  )

list(APPEND _IMPORT_CHECK_TARGETS shark )
list(APPEND _IMPORT_CHECK_FILES_FOR_shark "${_IMPORT_PREFIX}/lib/libshark.so.3.1.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
