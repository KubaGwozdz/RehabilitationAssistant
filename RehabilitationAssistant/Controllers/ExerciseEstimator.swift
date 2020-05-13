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
    }
    
    func makeHeadRelatedPose(pose: Pose) -> HeadRelatedPose {
        
        var headRelatedPose = HeadRelatedPose()
        let headRelate = Head()
        
        var headPartJoints = [Joint]()
        for (name, joint) in pose.joints where headRelate.headParts.contains(name){
            headPartJoints.append(joint)
        }
        
        let meanHeadPosition = headRelate.getMeanHeadPosition(joints: headPartJoints)
        print("meanHeadPosition: \(meanHeadPosition)")

        for (name, joint) in pose.joints {
                        
            if !headRelate.headParts.contains(name){
                
                let newPosition = getRelatedPoint(meanHeadPosition: meanHeadPosition, point: joint.position)
                headRelatedPose.setFieldOfName(name: name, val: newPosition)
            }
            
        }
        
        return headRelatedPose
        
    }
    
    func getRelatedPoint(meanHeadPosition: CGPoint, point: CGPoint) -> CGPoint {
        
        var newPoint = CGPoint(x: point.x - meanHeadPosition.x, y: point.y - meanHeadPosition.y)
        if newPoint == point {
            newPoint = CGPoint(x: 0, y: 0)
        }
        
        return newPoint
        
    }
    
    func scalePose(position: HeadRelatedPose, startingPoseArmScale: Double) -> Double {
        
        let shoulderPoint = position.leftShoulder
        let elbowPoint = position.leftElbow
        
        let distance = shoulderPoint.distance(to: elbowPoint)
        
        let diff = distance - startingPoseArmScale
        
        return diff
    }
    
    func checkPosition(threshold: Float = 15, position: HeadRelatedPose, exercise: Exercise) -> Float {
        
        let joints = position.getBodyJoints
        
        // getImportantJoints from exercise
        // for each important get CGPoint from position
        // get same joint from exercise !same position!
        
        return 3.0
    }
    
}
