//
//  PoseNet.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 25/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import CoreML
import Vision

protocol PoseNetDelegate: AnyObject {
    func poseNet(_ poseNet: PoseNet, didPredict predictions: PoseNetOutput)
}

class PoseNet {
    /// The delegate to receive the PoseNet model's outputs.
    weak var delegate: PoseNetDelegate?
    
    /// The PoseNet model's input size.
    let modelInputSize = CGSize(width: 513, height: 513)
    
    /// The PoseNet model's output stride.
    let outputStride = 16
    
    /// The Core ML model that the PoseNet model uses to generate estimates for the poses.
    ///
    /// - Note: Other variants of the PoseNet model are available from the Model Gallery.
    private let poseNetMLModel = PoseNetMobileNet075S16FP16().model
    
    
    /// Calls the `prediction` method of the PoseNet model and returns the outputs to the assigned
    /// `delegate`.
    ///
    /// - parameters:
    ///     - image: Image passed by the PoseNet model.
    func predict(_ image: CGImage) {
        DispatchQueue.global(qos: .userInitiated).async {
            // Wrap the image in an instance of PoseNetInput to have it resized
            // before being passed to the PoseNet model.
            let input = PoseNetInput(image: image, size: self.modelInputSize)
            
            guard let prediction = try? self.poseNetMLModel.prediction(from: input) else {
                return
            }
            
            let poseNetOutput = PoseNetOutput(prediction: prediction,
                                              modelInputSize: self.modelInputSize,
                                              modelOutputStride: self.outputStride)
            
            DispatchQueue.main.async {
                self.delegate?.poseNet(self, didPredict: poseNetOutput)
            }
        }
    }
}
