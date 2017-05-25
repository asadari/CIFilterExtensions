//
//  CIBoxBlurFilter.swift
//  Demo
//
//  Created by 杨晴贺 on 2017/5/26.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

public class CIBoxBlurFilter {
    
    public var image: CIImage
    public var radius: NSNumber = 10
    
    public init(image: CIImage, radius: NSNumber = 10){
        self.image = image
        self.radius = radius
    }
    
    public func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CIBoxBlur") else { return nil }
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(radius, forKey: "inputRadius")
        return filter
    }
    
}

extension CIImage {
    
    public func boxBlurFilter(radius: NSNumber = 10) -> CIImage? {
        guard let filter = CIFilter(name: "CIBoxBlur") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(radius, forKey: "inputRadius")
        return filter.outputImage
    }
    
}

