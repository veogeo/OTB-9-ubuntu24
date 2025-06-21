/*=========================================================================

  Program: Generic Region Merging Library
  Language: C++
  author: Lassalle Pierre
  contact: lassallepierre34@gmail.com



  Copyright (c) Centre National d'Etudes Spatiales. All rights reserved


     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notices for more information.

=========================================================================*/
#ifndef GRM_GRAPH_TO_OTBIMAGE_TXX
#define GRM_GRAPH_TO_OTBIMAGE_TXX
#include "grmGraphToOtbImage.h"
#include "itkImageRegionIterator.h"
#include "itkGrayscaleFillholeImageFilter.h"

namespace grm
{
	template<class TGraph>
	typename GraphToOtbImage<TGraph>::LabelImageType::Pointer
	GraphToOtbImage<TGraph>::GetLabelImage(const GraphType& graph,
										   const unsigned int width,
										   const unsigned int height)
	{
		LabelImageType::IndexType index;
		LabelImageType::SizeType size;
		LabelImageType::RegionType region;

		index[0] = 0; index[1] = 0;
		size[0] = width; size[1] = height;
		region.SetIndex(index);
		region.SetSize(size);

		LabelImageType::Pointer label_img = LabelImageType::New();
		label_img->SetRegions(region);
		label_img->Allocate();

		using LabelImageIterator = itk::ImageRegionIterator<LabelImageType>;
		LabelImageIterator it(label_img, label_img->GetLargestPossibleRegion());
		for(it.GoToBegin();!it.IsAtEnd(); ++it)
			it.Set(0);
		
		// Start at 1 (value 0 can be used for invalid pixels)
		unsigned int label = 1;
		for(auto& node : graph.m_Nodes)
		{
			lp::CellLists borderPixels;
			ContourOperator::GenerateBorderCells(borderPixels, node->m_Contour, node->m_Id, width);
			
			for (auto& pix: borderPixels)
			{
				index[0] = pix % width;
				index[1] = pix / width;
				label_img->SetPixel(index, label);
			}
			++label;
		}

        // Fill holes
		typedef itk::GrayscaleFillholeImageFilter<LabelImageType,LabelImageType>  FillholeFilterType;
		FillholeFilterType::Pointer fillFilter = FillholeFilterType::New();
		fillFilter->SetInput(label_img);
		fillFilter->Update();
		
		return fillFilter->GetOutput();
	}

	template<class TGraph>
	typename GraphToOtbImage<TGraph>::ClusteredImageType::Pointer
	GraphToOtbImage<TGraph>::GetClusteredOutput(const GraphType& graph,
												const unsigned int width,
												const unsigned int height)
	{
		ClusteredImageType::IndexType index;
		ClusteredImageType::SizeType size;
		ClusteredImageType::RegionType region;

		index[0] = 0; index[1] = 0;
		size[0] = width; size[1] = height;
		region.SetIndex(index);
		region.SetSize(size);

		ClusteredImageType::Pointer clusterImg = ClusteredImageType::New();
		clusterImg->SetRegions(region);
		clusterImg->SetNumberOfComponentsPerPixel(3);
		clusterImg->Allocate();

		ClusteredImageType::PixelType pixelValue;
		pixelValue.Reserve(3);
		pixelValue[0] = 255;
		pixelValue[1] = 255;
		pixelValue[2] = 255;

		using ClusterImageIterator = itk::ImageRegionIterator<ClusteredImageType>;
		ClusterImageIterator it(clusterImg, clusterImg->GetLargestPossibleRegion());
		for(it.GoToBegin();!it.IsAtEnd(); ++it)
			it.Set(pixelValue);

		srand(time(NULL));
		unsigned char c1, c2, c3;
		for(auto& node : graph.m_Nodes)
		{
			auto rv = rand() % 255;
			c1 = rv;//rand() % 256;
			c2 = rv;//rand() % 256;
			c3 = rv;//rand() % 256;

			lp::CellLists borderPixels;
			ContourOperator::GenerateBorderCells(borderPixels, node->m_Contour, node->m_Id, width);
			
			for (auto& pix : borderPixels)
			{
				index[0] = pix % width;
				index[1] = pix / width;
				pixelValue[0] = c1;
				pixelValue[1] = c2;
				pixelValue[2] = c3;
				clusterImg->SetPixel(index, pixelValue);
			}
		}

		
		for(it.GoToBegin(); !it.IsAtEnd(); ++it)
		{
			auto pixel = it.Get();
			if(pixel[0] == 255 && pixel[1] == 255 && pixel[2] == 255)
				it.Set(pixelValue);
			else
				pixelValue = pixel;
		}
		
		return clusterImg;
	}
		
} // end of namespace grm
#endif
