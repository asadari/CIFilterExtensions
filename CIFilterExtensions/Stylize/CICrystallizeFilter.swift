//
//  CICrystallizeFilter.swift
//  Demo
//
//  Created by Silence on 2017/5/26.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

public class CICrystallizeFilter {
    
    public var image: CIImage
    public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
    public var radius: NSNumber = 20
    
    public init(image: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), radius: NSNumber = 20){
        self.image = image
        self.center = center
        self.radius = radius
    }
    
    public func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CICrystallize") else { return nil }
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(center, forKey: "inputCenter")
        filter.setValue(radius, forKey: "inputRadius")
        return filter
    }
    
}

extension CIImage {
    
    public func crystallizeFilter(center: CIVector = CIVector(values: [150.0, 150.0], count: 2), radius: NSNumber = 20) -> CIImage? {
        guard let filter = CIFilter(name: "CICrystallize") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(center, forKey: "inputCenter")
        filter.setValue(radius, forKey: "inputRadius")
        return filter.outputImage
    }
    
}

