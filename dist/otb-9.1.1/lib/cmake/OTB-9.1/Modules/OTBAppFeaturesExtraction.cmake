#
# Copyright (C) 2005-2024 Centre National d'Etudes Spatiales (CNES)
#
# This file is part of Orfeo Toolbox
#
#     https://www.orfeo-toolbox.org/
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set(OTBAppFeaturesExtraction_LOADED 1)
set(OTBAppFeaturesExtraction_DEPENDS "OTBApplicationEngine;OTBBoostAdapters;OTBCarto;OTBChangeDetection;OTBColorMap;OTBCommon;OTBContrast;OTBConversion;OTBConvolution;OTBCurlAdapters;OTBDescriptors;OTBDimensionalityReduction;OTBEdge;OTBFunctor;OTBGDAL;OTBGdalAdapters;OTBIOXML;OTBITK;OTBImageBase;OTBImageManipulation;OTBIndices;OTBMathParser;OTBMathParserX;OTBObjectList;OTBProjection;OTBSmoothing;OTBStatistics;OTBStreaming;OTBTextures;OTBTransform;OTBVectorDataBase;OTBVectorDataManipulation")
set(OTBAppFeaturesExtraction_LIBRARIES "OTBApplicationEngine;Boost::filesystem;Boost::serialization;Boost::unit_test_framework;OTBCarto;OTBCommon;ITKCommon;itksys;itkvnl_algo;itkvnl;itkv3p_netlib;itknetlib;itkvcl;ITKStatistics;ITKTransform;itkNetlibSlatec;ITKMesh;ITKQuadEdgeMesh;ITKSpatialObjects;ITKMetaIO;${OTB_INSTALL_PREFIX}/lib/libz.so;ITKLabelMap;ITKPath;ITKIOImageBase;ITKOptimizers;ITKBiasCorrection;ITKPolynomials;ITKFFT;ITKOptimizersv4;ITKKLMRegionGrowing;ITKWatersheds;OTBImageManipulation;OTBProjection;OTBStatistics;OTBImageBase;${OTB_INSTALL_PREFIX}/lib/libgdal.so;OTBGdalAdapters;OTBIOGDAL;OTBVectorDataBase;OTBTransform;OTBMetadata;OTBStreaming;OTBCurlAdapters;otbsiftfast;${OTB_INSTALL_PREFIX}/lib/libtinyxml.so;OTBFuzzy;OTBMathParser;OTBMathParserX")
set(OTBAppFeaturesExtraction_INCLUDE_DIRS "${OTB_INSTALL_PREFIX}/include/OTB-9.1")
set(OTBAppFeaturesExtraction_LIBRARY_DIRS "")

