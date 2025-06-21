#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "itkdouble-conversion" for configuration "Release"
set_property(TARGET itkdouble-conversion APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(itkdouble-conversion PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libitkdouble-conversion-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libitkdouble-conversion-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS itkdouble-conversion )
list(APPEND _IMPORT_CHECK_FILES_FOR_itkdouble-conversion "${_IMPORT_PREFIX}/lib/libitkdouble-conversion-4.13.so.1" )

# Import target "itksys" for configuration "Release"
set_property(TARGET itksys APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(itksys PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "dl;dl"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libitksys-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libitksys-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS itksys )
list(APPEND _IMPORT_CHECK_FILES_FOR_itksys "${_IMPORT_PREFIX}/lib/libitksys-4.13.so.1" )

# Import target "itkvcl" for configuration "Release"
set_property(TARGET itkvcl APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(itkvcl PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "m"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libitkvcl-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libitkvcl-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS itkvcl )
list(APPEND _IMPORT_CHECK_FILES_FOR_itkvcl "${_IMPORT_PREFIX}/lib/libitkvcl-4.13.so.1" )

# Import target "itknetlib" for configuration "Release"
set_property(TARGET itknetlib APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(itknetlib PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "m"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libitknetlib-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libitknetlib-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS itknetlib )
list(APPEND _IMPORT_CHECK_FILES_FOR_itknetlib "${_IMPORT_PREFIX}/lib/libitknetlib-4.13.so.1" )

# Import target "itkv3p_netlib" for configuration "Release"
set_property(TARGET itkv3p_netlib APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(itkv3p_netlib PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "m"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libitkv3p_netlib-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libitkv3p_netlib-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS itkv3p_netlib )
list(APPEND _IMPORT_CHECK_FILES_FOR_itkv3p_netlib "${_IMPORT_PREFIX}/lib/libitkv3p_netlib-4.13.so.1" )

# Import target "itkvnl" for configuration "Release"
set_property(TARGET itkvnl APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(itkvnl PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "itkvcl"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libitkvnl-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libitkvnl-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS itkvnl )
list(APPEND _IMPORT_CHECK_FILES_FOR_itkvnl "${_IMPORT_PREFIX}/lib/libitkvnl-4.13.so.1" )

# Import target "itkvnl_algo" for configuration "Release"
set_property(TARGET itkvnl_algo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(itkvnl_algo PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "itknetlib;itkv3p_netlib;itkvnl"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libitkvnl_algo-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libitkvnl_algo-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS itkvnl_algo )
list(APPEND _IMPORT_CHECK_FILES_FOR_itkvnl_algo "${_IMPORT_PREFIX}/lib/libitkvnl_algo-4.13.so.1" )

# Import target "ITKVNLInstantiation" for configuration "Release"
set_property(TARGET ITKVNLInstantiation APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKVNLInstantiation PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKVNLInstantiation-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKVNLInstantiation-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKVNLInstantiation )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKVNLInstantiation "${_IMPORT_PREFIX}/lib/libITKVNLInstantiation-4.13.so.1" )

# Import target "ITKCommon" for configuration "Release"
set_property(TARGET ITKCommon APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKCommon PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "itkdouble-conversion"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKCommon-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKCommon-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKCommon )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKCommon "${_IMPORT_PREFIX}/lib/libITKCommon-4.13.so.1" )

# Import target "itkNetlibSlatec" for configuration "Release"
set_property(TARGET itkNetlibSlatec APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(itkNetlibSlatec PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libitkNetlibSlatec-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libitkNetlibSlatec-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS itkNetlibSlatec )
list(APPEND _IMPORT_CHECK_FILES_FOR_itkNetlibSlatec "${_IMPORT_PREFIX}/lib/libitkNetlibSlatec-4.13.so.1" )

# Import target "ITKStatistics" for configuration "Release"
set_property(TARGET ITKStatistics APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKStatistics PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKStatistics-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKStatistics-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKStatistics )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKStatistics "${_IMPORT_PREFIX}/lib/libITKStatistics-4.13.so.1" )

# Import target "ITKTransform" for configuration "Release"
set_property(TARGET ITKTransform APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKTransform PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKTransform-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKTransform-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKTransform )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKTransform "${_IMPORT_PREFIX}/lib/libITKTransform-4.13.so.1" )

# Import target "ITKLabelMap" for configuration "Release"
set_property(TARGET ITKLabelMap APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKLabelMap PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ITKStatistics"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKLabelMap-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKLabelMap-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKLabelMap )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKLabelMap "${_IMPORT_PREFIX}/lib/libITKLabelMap-4.13.so.1" )

# Import target "ITKMesh" for configuration "Release"
set_property(TARGET ITKMesh APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKMesh PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ITKTransform"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKMesh-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKMesh-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKMesh )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKMesh "${_IMPORT_PREFIX}/lib/libITKMesh-4.13.so.1" )

# Import target "ITKMetaIO" for configuration "Release"
set_property(TARGET ITKMetaIO APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKMetaIO PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKMetaIO-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKMetaIO-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKMetaIO )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKMetaIO "${_IMPORT_PREFIX}/lib/libITKMetaIO-4.13.so.1" )

# Import target "ITKSpatialObjects" for configuration "Release"
set_property(TARGET ITKSpatialObjects APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKSpatialObjects PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ITKCommon;ITKMesh"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKSpatialObjects-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKSpatialObjects-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKSpatialObjects )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKSpatialObjects "${_IMPORT_PREFIX}/lib/libITKSpatialObjects-4.13.so.1" )

# Import target "ITKPath" for configuration "Release"
set_property(TARGET ITKPath APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKPath PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ITKCommon"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKPath-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKPath-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKPath )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKPath "${_IMPORT_PREFIX}/lib/libITKPath-4.13.so.1" )

# Import target "ITKQuadEdgeMesh" for configuration "Release"
set_property(TARGET ITKQuadEdgeMesh APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKQuadEdgeMesh PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ITKMesh"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKQuadEdgeMesh-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKQuadEdgeMesh-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKQuadEdgeMesh )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKQuadEdgeMesh "${_IMPORT_PREFIX}/lib/libITKQuadEdgeMesh-4.13.so.1" )

# Import target "ITKIOImageBase" for configuration "Release"
set_property(TARGET ITKIOImageBase APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKIOImageBase PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKIOImageBase-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKIOImageBase-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKIOImageBase )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKIOImageBase "${_IMPORT_PREFIX}/lib/libITKIOImageBase-4.13.so.1" )

# Import target "ITKOptimizers" for configuration "Release"
set_property(TARGET ITKOptimizers APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKOptimizers PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKOptimizers-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKOptimizers-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKOptimizers )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKOptimizers "${_IMPORT_PREFIX}/lib/libITKOptimizers-4.13.so.1" )

# Import target "ITKPolynomials" for configuration "Release"
set_property(TARGET ITKPolynomials APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKPolynomials PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKPolynomials-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKPolynomials-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKPolynomials )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKPolynomials "${_IMPORT_PREFIX}/lib/libITKPolynomials-4.13.so.1" )

# Import target "ITKBiasCorrection" for configuration "Release"
set_property(TARGET ITKBiasCorrection APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKBiasCorrection PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ITKCommon"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKBiasCorrection-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKBiasCorrection-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKBiasCorrection )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKBiasCorrection "${_IMPORT_PREFIX}/lib/libITKBiasCorrection-4.13.so.1" )

# Import target "ITKFFT" for configuration "Release"
set_property(TARGET ITKFFT APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKFFT PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ITKCommon"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKFFT-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKFFT-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKFFT )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKFFT "${_IMPORT_PREFIX}/lib/libITKFFT-4.13.so.1" )

# Import target "ITKTransformFactory" for configuration "Release"
set_property(TARGET ITKTransformFactory APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKTransformFactory PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKTransformFactory-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKTransformFactory-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKTransformFactory )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKTransformFactory "${_IMPORT_PREFIX}/lib/libITKTransformFactory-4.13.so.1" )

# Import target "ITKIOTransformBase" for configuration "Release"
set_property(TARGET ITKIOTransformBase APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKIOTransformBase PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKIOTransformBase-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKIOTransformBase-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKIOTransformBase )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKIOTransformBase "${_IMPORT_PREFIX}/lib/libITKIOTransformBase-4.13.so.1" )

# Import target "ITKIOTransformInsightLegacy" for configuration "Release"
set_property(TARGET ITKIOTransformInsightLegacy APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKIOTransformInsightLegacy PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "itkdouble-conversion"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKIOTransformInsightLegacy-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKIOTransformInsightLegacy-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKIOTransformInsightLegacy )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKIOTransformInsightLegacy "${_IMPORT_PREFIX}/lib/libITKIOTransformInsightLegacy-4.13.so.1" )

# Import target "ITKIOTransformMatlab" for configuration "Release"
set_property(TARGET ITKIOTransformMatlab APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKIOTransformMatlab PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKIOTransformMatlab-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKIOTransformMatlab-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKIOTransformMatlab )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKIOTransformMatlab "${_IMPORT_PREFIX}/lib/libITKIOTransformMatlab-4.13.so.1" )

# Import target "ITKKLMRegionGrowing" for configuration "Release"
set_property(TARGET ITKKLMRegionGrowing APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKKLMRegionGrowing PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKKLMRegionGrowing-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKKLMRegionGrowing-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKKLMRegionGrowing )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKKLMRegionGrowing "${_IMPORT_PREFIX}/lib/libITKKLMRegionGrowing-4.13.so.1" )

# Import target "itklbfgs" for configuration "Release"
set_property(TARGET itklbfgs APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(itklbfgs PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libitklbfgs-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libitklbfgs-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS itklbfgs )
list(APPEND _IMPORT_CHECK_FILES_FOR_itklbfgs "${_IMPORT_PREFIX}/lib/libitklbfgs-4.13.so.1" )

# Import target "ITKOptimizersv4" for configuration "Release"
set_property(TARGET ITKOptimizersv4 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKOptimizersv4 PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "itklbfgs"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKOptimizersv4-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKOptimizersv4-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKOptimizersv4 )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKOptimizersv4 "${_IMPORT_PREFIX}/lib/libITKOptimizersv4-4.13.so.1" )

# Import target "ITKWatersheds" for configuration "Release"
set_property(TARGET ITKWatersheds APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ITKWatersheds PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libITKWatersheds-4.13.so.1"
  IMPORTED_SONAME_RELEASE "libITKWatersheds-4.13.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS ITKWatersheds )
list(APPEND _IMPORT_CHECK_FILES_FOR_ITKWatersheds "${_IMPORT_PREFIX}/lib/libITKWatersheds-4.13.so.1" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
