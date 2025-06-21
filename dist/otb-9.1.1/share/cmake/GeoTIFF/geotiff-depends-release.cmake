#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "geotiff_library" for configuration "Release"
set_property(TARGET geotiff_library APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(geotiff_library PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "PROJ::proj"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libgeotiff.so.5.3.2"
  IMPORTED_SONAME_RELEASE "libgeotiff.so.5"
  )

list(APPEND _IMPORT_CHECK_TARGETS geotiff_library )
list(APPEND _IMPORT_CHECK_FILES_FOR_geotiff_library "${_IMPORT_PREFIX}/lib/libgeotiff.so.5.3.2" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
