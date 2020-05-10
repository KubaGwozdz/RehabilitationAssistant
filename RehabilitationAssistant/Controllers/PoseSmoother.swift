//
//  PoseSmoother.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 23/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import CoreGraphics

class PoseSmoother{
    let windowSize = 5
    
    private(set) var jointsQ: [Joint.Name: [Joint]] = [
        .nose: [Joint(name: .nose)],
        .leftEye: [Joint(name: .leftEye)],
        .leftEar: [Joint(name: .leftEar)],
        .leftShoulder: [Joint(name: .leftShoulder)],
        .leftElbow: [Joint(name: .leftElbow)],
        .leftWrist: [Joint(name: .leftWrist)],
        .leftHip: [Joint(name: .leftHip)],
        .leftKnee: [Joint(name: .leftKnee)],
        .leftAnkle: [Joint(name: .leftAnkle)],
        .rightEye: [Joint(name: .rightEye)],
        .rightEar: [Joint(name: .rightEar)],
        .rightShoulder: [Joint(name: .rightShoulder)],
        .rightElbow: [Joint(name: .rightElbow)],
        .rightWrist: [Joint(name: .rightWrist)],
        .rightHip: [Joint(name: .rightHip)],
        .rightKnee: [Joint(name: .rightKnee)],
        .rightAnkle: [Joint(name: .rightAnkle)]
    ]
    
    
    private func enque(joint: Joint){
        if jointsQ[joint.name]!.count == windowSize{
            jointsQ[joint.name]!.removeFirst()
        }
        jointsQ[joint.name]!.append(joint)
    }
    
    private func dequeue(jointName: Joint.Name){
        if !jointsQ[jointName]!.isEmpty {
            jointsQ[jointName]!.removeFirst()
        }
    }
    
    private func updatePose(pose: Pose){
        for (name, joint) in pose.joints{
            if joint.isValid {
                enque(joint: joint)
            } else {
                dequeue(jointName: name)
            }
        }
    }
    
    private func getMeanJoint(joint: Joint){
        let q = jointsQ[joint.name]!
        
        if !q.isEmpty {
            var x = 0.0
            var y = 0.0
            var confidence = 0.0
            
            for joint in q{
                x += Double(joint.position.x)
                y += Double(joint.position.y)
                confidence += joint.confidence
            }
            let jCount = Double(q.count)
            x = x/jCount
            y = y/jCount
            confidence = confidence/jCount
            
            joint.position = CGPoint(x: x, y: y)
            joint.confidence = confidence
            joint.isValid = true
        } else {
            joint.isValid = false
            joint.confidence = 0.0
        }
    }
    
    func getPose() -> Pose {
        var pose = Pose()
        pose.joints.values.forEach { joint in
            getMeanJoint(joint: joint)
        }
        return pose
    }
    
    func getCurrentPose(pose: Pose) -> Pose{
        updatePose(pose: pose)
        return getPose()
    }
    
}
