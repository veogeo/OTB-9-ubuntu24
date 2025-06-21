#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "GSL::gsl" for configuration "Release"
set_property(TARGET GSL::gsl APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(GSL::gsl PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libgsl.so"
  IMPORTED_SONAME_RELEASE "libgsl.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS GSL::gsl )
list(APPEND _IMPORT_CHECK_FILES_FOR_GSL::gsl "${_IMPORT_PREFIX}/lib/libgsl.so" )

# Import target "GSL::gslcblas" for configuration "Release"
set_property(TARGET GSL::gslcblas APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(GSL::gslcblas PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libgslcblas.so"
  IMPORTED_SONAME_RELEASE "libgslcblas.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS GSL::gslcblas )
list(APPEND _IMPORT_CHECK_FILES_FOR_GSL::gslcblas "${_IMPORT_PREFIX}/lib/libgslcblas.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
