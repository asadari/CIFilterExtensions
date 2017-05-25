//
//  CIDissolveTransitionFilter.swift
//  Demo
//
//  Created by 杨晴贺 on 2017/5/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

public class CIDissolveTransitionFilter {
    
    public var image: CIImage
    public var targetImage: CIImage
    public var time: NSNumber = 0
    
    public init(image: CIImage, targetImage: CIImage, time: NSNumber = 0){
        self.image = image
        self.targetImage = targetImage
        self.time = time
    }
    
    public func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CIDissolveTransition") else { return nil }
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(targetImage, forKey: "inputTargetImage")
        filter.setValue(time, forKey: "inputTime")
        return filter
    }
    
}

extension CIImage {
    
    public func dissolveTransitionFilter(targetImage: CIImage, time: NSNumber = 0) -> CIImage? {
        guard let filter = CIFilter(name: "CIDissolveTransition") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(targetImage, forKey: "inputTargetImage")
        filter.setValue(time, forKey: "inputTime")
        return filter.outputImage
    }
    
}

