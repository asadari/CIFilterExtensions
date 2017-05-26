//
//  CIFourfoldRotatedTileFilter.swift
//  Demo
//
//  Created by Silence on 2017/5/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

public class CIFourfoldRotatedTileFilter {
    
    public var width: NSNumber = 100
    public var image: CIImage
    public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
    public var angle: NSNumber = 0
    
    public init(width: NSNumber = 100, image: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0){
        self.width = width
        self.image = image
        self.center = center
        self.angle = angle
    }
    
    public func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CIFourfoldRotatedTile") else { return nil }
        filter.setValue(width, forKey: "inputWidth")
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(center, forKey: "inputCenter")
        filter.setValue(angle, forKey: "inputAngle")
        return filter
    }
    
}

extension CIImage {
    
    public func fourfoldRotatedTileFilter(width: NSNumber = 100, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0) -> CIImage? {
        guard let filter = CIFilter(name: "CIFourfoldRotatedTile") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(width, forKey: "inputWidth")
        filter.setValue(center, forKey: "inputCenter")
        filter.setValue(angle, forKey: "inputAngle")
        return filter.outputImage
    }
    
}

