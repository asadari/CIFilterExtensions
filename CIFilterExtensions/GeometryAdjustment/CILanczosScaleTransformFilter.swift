//
//  CILanczosScaleTransformFilter.swift
//  Demo
//
//  Created by Silence on 2017/5/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

public class CILanczosScaleTransformFilter {
    
    public var image: CIImage
    public var aspectRatio: NSNumber = 1
    public var scale: NSNumber = 1
    
    public init(image: CIImage,
                aspectRatio: NSNumber = 1,
                scale: NSNumber = 1){
        self.image = image
        self.aspectRatio = aspectRatio
        self.scale = scale
    }
    
    public func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CILanczosScaleTransform") else { return nil }
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(aspectRatio, forKey: "inputAspectRatio")
        filter.setValue(scale, forKey: "inputScale")
        return filter
    }
    
}

extension CIImage {
    
    public func lanczosScaleTransformFilter(aspectRatio: NSNumber = 1,
                                            scale: NSNumber = 1) -> CIImage? {
        guard let filter = CIFilter(name: "CILanczosScaleTransform") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(aspectRatio, forKey: "inputAspectRatio")
        filter.setValue(scale, forKey: "inputScale")
        return filter.outputImage
    }
    
}

