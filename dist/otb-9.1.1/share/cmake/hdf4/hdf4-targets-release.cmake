#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "xdr-static" for configuration "Release"
set_property(TARGET xdr-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(xdr-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libxdr.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS xdr-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_xdr-static "${_IMPORT_PREFIX}/lib/libxdr.a" )

# Import target "xdr-shared" for configuration "Release"
set_property(TARGET xdr-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(xdr-shared PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libxdr.so.4.15.2"
  IMPORTED_SONAME_RELEASE "libxdr.so.4"
  )

list(APPEND _IMPORT_CHECK_TARGETS xdr-shared )
list(APPEND _IMPORT_CHECK_FILES_FOR_xdr-shared "${_IMPORT_PREFIX}/lib/libxdr.so.4.15.2" )

# Import target "dfalt-static" for configuration "Release"
set_property(TARGET dfalt-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(dfalt-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libdfalt.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS dfalt-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_dfalt-static "${_IMPORT_PREFIX}/lib/libdfalt.a" )

# Import target "dfalt-shared" for configuration "Release"
set_property(TARGET dfalt-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(dfalt-shared PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libdfalt.so.4.15.2"
  IMPORTED_SONAME_RELEASE "libdfalt.so.4"
  )

list(APPEND _IMPORT_CHECK_TARGETS dfalt-shared )
list(APPEND _IMPORT_CHECK_FILES_FOR_dfalt-shared "${_IMPORT_PREFIX}/lib/libdfalt.so.4.15.2" )

# Import target "mfhdfalt-static" for configuration "Release"
set_property(TARGET mfhdfalt-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mfhdfalt-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libmfhdfalt.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS mfhdfalt-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_mfhdfalt-static "${_IMPORT_PREFIX}/lib/libmfhdfalt.a" )

# Import target "mfhdfalt-shared" for configuration "Release"
set_property(TARGET mfhdfalt-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mfhdfalt-shared PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libmfhdfalt.so.4.15.2"
  IMPORTED_SONAME_RELEASE "libmfhdfalt.so.4"
  )

list(APPEND _IMPORT_CHECK_TARGETS mfhdfalt-shared )
list(APPEND _IMPORT_CHECK_FILES_FOR_mfhdfalt-shared "${_IMPORT_PREFIX}/lib/libmfhdfalt.so.4.15.2" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
