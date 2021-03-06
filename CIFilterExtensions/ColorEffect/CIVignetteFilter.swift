//
//  CIVignetteFilter.swift
//  Demo
//
//  Created by Silence on 2017/5/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

public class CIVignetteFilter {
    
    public var intensity: NSNumber = 0
    public var image: CIImage
    public var radius: NSNumber = 1
    
    public init(intensity: NSNumber = 0, image: CIImage, radius: NSNumber = 1){
        self.intensity = intensity
        self.image = image
        self.radius = radius
    }
    
    public func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CIVignette") else { return nil }
        filter.setValue(intensity, forKey: "inputIntensity")
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(radius, forKey: "inputRadius")
        return filter
    }
    
}

extension CIImage {
    
    public func vignetteFilter(intensity: NSNumber = 0, radius: NSNumber = 1) -> CIImage? {
        guard let filter = CIFilter(name: "CIVignette") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(intensity, forKey: "inputIntensity")
        filter.setValue(radius, forKey: "inputRadius")
        return filter.outputImage
    }
    
}

