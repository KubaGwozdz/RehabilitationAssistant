//
//  PoseNetInput.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 25/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import CoreML
import Vision

/// - Tag: PoseNetInput
class PoseNetInput: MLFeatureProvider {

    private static let imageFeatureName = "image"

    /// The original image this feature provider uses as input to its consumers.
    var imageFeature: CGImage
    
    /// The size of the images this feature provider produces to its consumers.
    ///
    /// The feature provider resizes the `imageFeature` property by
    /// cropping and resizing it to this size in the `featureValue(for:)` method.
    let imageFeatureSize: CGSize

    var featureNames: Set<String> {
        return [PoseNetInput.imageFeatureName]
    }
    
    init(image: CGImage, size: CGSize) {
        imageFeature = image
        imageFeatureSize = size
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        guard featureName == PoseNetInput.imageFeatureName else {
            return nil
        }

        let options: [MLFeatureValue.ImageOption: Any] = [
            .cropAndScale: VNImageCropAndScaleOption.scaleFill.rawValue
        ]

        return try? MLFeatureValue(cgImage: imageFeature,
                                   pixelsWide: Int(imageFeatureSize.width),
                                   pixelsHigh: Int(imageFeatureSize.height),
                                   pixelFormatType: imageFeature.pixelFormatInfo.rawValue,
                                   options: options)
    }
}
