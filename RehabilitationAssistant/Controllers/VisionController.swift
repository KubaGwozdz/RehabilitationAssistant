//
//  VisionController.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 24/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation
import UIKit
import VideoToolbox


extension Notification.Name {
  static var doneReps: Notification.Name { return .init("doneReps") }
}

class VisionController : UIViewController {
    
    private var previewImageView: PoseImageView = PoseImageView()
    private var subviewAdded: Bool = false
    
    private let videoCapture = VideoCapture()
    
    private let poseNet = PoseNet()
    
    private let smoother = PoseSmoother()
    
    private let hrpBuilder = HeadRelatedPoseBuilder()
        
    private let repsCounter = RepsCounter()
    
    weak var exercise: ExerciseViewModel?{
        didSet{
            repsCounter.setExercise(exercise!)
        }
    }
                
    /// The frame the PoseNet model is currently making pose predictions from.
    private var currentFrame: CGImage?
    
    /// The set of parameters passed to the pose builder when detecting poses.
    private var poseBuilderConfiguration = PoseBuilderConfiguration()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // For convenience, the idle timer is disabled to prevent the screen from locking.
        //        UIApplication.shared.isIdleTimerDisabled = true
        poseNet.delegate = self
        setupAndBeginCapturingVideoFrames()
    }
    
    private func setupAndBeginCapturingVideoFrames() {
        videoCapture.setUpAVCapture { error in
            if let error = error {
                print("Failed to setup camera with error \(error)")
                return
            }
            self.videoCapture.delegate = self
            self.videoCapture.startCapturing()
        }
    }
    
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        // Reinitilize the camera to update its output stream with the new orientation.
        setupAndBeginCapturingVideoFrames()
    }
    
    func onCameraButtonTapped() {
        videoCapture.flipCamera { error in
            if let error = error {
                print("Failed to flip camera with error \(error)")
            }
        }
    }
    
    func stop(){
        videoCapture.stopCapturing()
    }
    
    
    
}

// MARK: - VideoCaptureDelegate

extension VisionController: VideoCaptureDelegate {
    func videoCapture(_ videoCapture: VideoCapture, didCaptureFrame capturedImage: CGImage?) {
        guard currentFrame == nil else {
            return
        }
        guard let image = capturedImage else {
            fatalError("Captured image is null")
        }
        
        currentFrame = image
        poseNet.predict(image)
    }
}

// MARK: - PoseNetDelegate

extension VisionController: PoseNetDelegate {
    func poseNet(_ poseNet: PoseNet, didPredict predictions: PoseNetOutput) {
        defer {
            // Release `currentFrame` when exiting this method.
            self.currentFrame = nil
        }

        guard let currentFrame = currentFrame else {
            return
        }

        let poseBuilder = PoseBuilder(output: predictions,
                                      configuration: poseBuilderConfiguration,
                                      inputImage: currentFrame)

        
        let builderPoses = [poseBuilder.pose]
        let pose = smoother.getCurrentPose(pose: builderPoses[0])
        
//        hrpBuilder.showPose(pose: pose)
        
        let headRelatedPose = hrpBuilder.makeHeadRelatedPose(pose: pose)
        hrpBuilder.showHeadRelatedPose(headRelatedPose: headRelatedPose)
        repsCounter.count(headRelatedPose)
        
        
        previewImageView.show(poses: [pose], on: currentFrame)
        if !self.subviewAdded{
            view.layer.addSublayer(self.previewImageView.layer)
            previewImageView.frame = view.frame
            self.subviewAdded = true
        }
    }
}
