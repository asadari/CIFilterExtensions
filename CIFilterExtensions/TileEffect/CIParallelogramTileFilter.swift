//
//  CIParallelogramTileFilter.swift
//  Demo
//
//  Created by 杨晴贺 on 2017/5/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

public class ParallelogramTile {
    
    public var width: NSNumber = 100
    public var image: CIImage
    public var acuteAngle: NSNumber = 1.570796326794897
    public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
    public var angle: NSNumber = 0
    
    public init(width: NSNumber = 100, image: CIImage, acuteAngle: NSNumber = 1.570796326794897, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0){
        self.width = width
        self.image = image
        self.acuteAngle = acuteAngle
        self.center = center
        self.angle = angle
    }
    
    public func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CIParallelogramTile") else { return nil }
        filter.setValue(width, forKey: "inputWidth")
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(acuteAngle, forKey: "inputAcuteAngle")
        filter.setValue(center, forKey: "inputCenter")
        filter.setValue(angle, forKey: "inputAngle")
        return filter
    }
    
}

extension CIImage {
    
    public func parallelogramTileFilter(width: NSNumber = 100, acuteAngle: NSNumber = 1.570796326794897, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0) -> CIImage? {
        guard let filter = CIFilter(name: "CIParallelogramTile") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(width, forKey: "inputWidth")
        filter.setValue(acuteAngle, forKey: "inputAcuteAngle")
        filter.setValue(center, forKey: "inputCenter")
        filter.setValue(angle, forKey: "inputAngle")
        return filter.outputImage
    }
    
}

