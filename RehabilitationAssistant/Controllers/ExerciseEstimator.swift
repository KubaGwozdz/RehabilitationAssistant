//
//  Trainer.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 10/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import CoreGraphics


class ExerciseEstimator {
    var threshold: Double = 1.5
    
    func showPose(pose: Pose){
        print("POSE:")
        for (name, joint) in pose.joints{
            print("\(name): \(joint.position)")
        }
    }
    
    func showHeadRelatedPose(headRelatedPose: HeadRelatedPose){
        print("HeadRelatedPose:")
        print("head: \(headRelatedPose.head)")
        for (name, joint) in headRelatedPose.getBodyJoints(){
            print("\(name): \(joint)")
        }
        var simplePose = HeadRelatedPose(
            leftShoulder: CGPoint(x:0.6, y:0.9),
            leftElbow: CGPoint(x: 0.85, y: 1.9),
            leftWrist: CGPoint(x:1, y:2.9),
            leftHip: CGPoint(x:0.55, y:2.8),
            leftKnee: CGPoint(x:-0.6, y:4.3),
            leftAnkle: CGPoint(x: 0.7, y:5.6),
            rightShoulder: CGPoint(x: -0.6, y:1.0),
            rightElbow: CGPoint(x:-0.7, y:2.0),
            rightWrist: CGPoint(x:-0.7, y:3.0),
            rightHip: CGPoint(x: -0.2, y: 2.8),
            rightKnee: CGPoint(x: -0.1, y: 4.3),
            rightAnkle: CGPoint(x:-0.1, y:5.7)
            )
        let match = checkIfPosesMatch(pose: headRelatedPose, exercisePose: simplePose)
        print("POSES MATCH: \(match)")
    }
    
    func checkIfPosesMatch(pose: HeadRelatedPose, exercisePose: HeadRelatedPose) -> Bool {
        for (name, position) in pose.getBodyJoints(){
            var distance = position.distance(to: exercisePose.getBodyJoints()[name]!)
            print("DISTANCE of \(name): \(distance)")
            if distance > threshold {
                return false
            }
        }
        return true
    }
    
    func makeHeadRelatedPose(pose: Pose) -> HeadRelatedPose {
        
        var headRelatedPose = HeadRelatedPose()
        let headRelate = Head()
        
        var headPartJoints = [Joint]()
        for (name, joint) in pose.joints where headRelate.headParts.contains(name){
            if joint.isValid{
                headPartJoints.append(joint)
            }
        }
        
        let meanHeadPosition = headRelate.getMeanHeadPosition(joints: headPartJoints)
        print("meanHeadPosition: \(meanHeadPosition)")

        for (name, joint) in pose.joints {
                        
            if !headRelate.headParts.contains(name){
                
                let newPosition = getRelatedPoint(meanHeadPosition: meanHeadPosition, point: joint.position)
                headRelatedPose.setFieldOfName(name: name, val: newPosition)
            }
            
        }
        
        return scalePose(headRelatedPose: headRelatedPose, thighboneLength: thighboneLength(pose: pose))
        
    }
    
    func getRelatedPoint(meanHeadPosition: CGPoint, point: CGPoint) -> CGPoint {
        
        var newPoint = CGPoint(x: point.x - meanHeadPosition.x, y: point.y - meanHeadPosition.y)
        if newPoint == point {
            newPoint = CGPoint(x: 0, y: 0)
        }
        
        return newPoint
        
    }
    
//    func scalePose(position: HeadRelatedPose, startingPoseArmScale: Double) -> Double {
//
//        let shoulderPoint = position.leftShoulder
//        let elbowPoint = position.leftElbow
//
//        let distance = shoulderPoint.distance(to: elbowPoint)
//
//        let diff = distance - startingPoseArmScale
//
//        return diff
//    }
    
    
    func thighboneLength(pose: Pose) -> CGFloat {
        var isValid = false
        var dev = 1.0
        var len = 0.0
        if pose.joints[.leftKnee]!.isValid && pose.joints[.leftHip]!.isValid{
            isValid = true
            dev += 1.0
            len += pose.joints[.leftKnee]!.position.distance(to: pose.joints[.leftHip]!.position)
            
        }
        if pose.joints[.rightKnee]!.isValid && pose.joints[.rightHip]!.isValid{
            isValid = true
            dev += 1.0
            len += pose.joints[.rightKnee]!.position.distance(to: pose.joints[.rightHip]!.position)
        }
        if isValid {
            return CGFloat(len/dev)
        } else {
            return CGFloat(1.0)
        }
    }
    
    
    func scalePose(headRelatedPose: HeadRelatedPose, thighboneLength: CGFloat) -> HeadRelatedPose {
        let scale = 1/thighboneLength
        var newPose = HeadRelatedPose()
        
        for (name, position) in headRelatedPose.getBodyJoints(){
            let newPosition = position * scale
            newPose.setFieldOfName(name: name, val: newPosition)
        }
        return newPose
    }
    
    func checkPosition(threshold: Float = 15, position: HeadRelatedPose, exercise: Exercise) -> Float {
        
        let joints = position.getBodyJoints
        
        // getImportantJoints from exercise
        // for each important get CGPoint from position
        // get same joint from exercise !same position!
        
        return 3.0
    }
    
}
