//
//  SimplePose.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 10/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import CoreGraphics

struct HeadRelatedPose {
    
    var head: CGPoint
    var leftShoulder: CGPoint
    var leftElbow: CGPoint
    var leftWrist: CGPoint
    var leftHip: CGPoint
    var leftKnee: CGPoint
    var leftAnkle: CGPoint
    var rightShoulder: CGPoint
    var rightElbow: CGPoint
    var rightWrist: CGPoint
    var rightHip: CGPoint
    var rightKnee: CGPoint
    var rightAnkle: CGPoint
    
    init() {
        head = CGPoint(x: 0, y: 0)
        leftShoulder = CGPoint(x: 0, y: 0)
        leftElbow = CGPoint(x: 0, y: 0)
        leftWrist = CGPoint(x: 0, y: 0)
        leftHip = CGPoint(x: 0, y: 0)
        leftKnee = CGPoint(x: 0, y: 0)
        leftAnkle = CGPoint(x: 0, y: 0)
        rightShoulder = CGPoint(x: 0, y: 0)
        rightElbow = CGPoint(x: 0, y: 0)
        rightWrist = CGPoint(x: 0, y: 0)
        rightHip = CGPoint(x: 0, y: 0)
        rightKnee = CGPoint(x: 0, y: 0)
        rightAnkle = CGPoint(x: 0, y: 0)
    }
    
    init(leftShoulder: CGPoint,
         leftElbow: CGPoint,
         leftWrist: CGPoint,
         leftHip: CGPoint,
         leftKnee: CGPoint,
         leftAnkle: CGPoint,
         rightShoulder: CGPoint,
         rightElbow: CGPoint,
         rightWrist: CGPoint,
         rightHip: CGPoint,
         rightKnee: CGPoint,
         rightAnkle: CGPoint){
        self.head = CGPoint(x: 0, y: 0)
        self.leftShoulder = leftShoulder
        self.leftElbow = leftElbow
        self.leftWrist = leftWrist
        self.leftHip = leftHip
        self.leftKnee = leftKnee
        self.leftAnkle = leftAnkle
        self.rightShoulder = rightShoulder
        self.rightElbow = rightElbow
        self.rightWrist = rightWrist
        self.rightHip = rightHip
        self.rightKnee = rightKnee
        self.rightAnkle = rightAnkle
    }

    func getBodyJoints() -> [Joint.Name: CGPoint] {
        
        var bodyJoints: [Joint.Name: CGPoint] =
            [.leftShoulder: leftShoulder, .leftElbow: leftElbow,
             .leftWrist: leftWrist, .leftHip: leftHip,
             .leftKnee: leftKnee, .leftAnkle: leftAnkle,
             .rightShoulder: rightShoulder, .rightElbow: rightElbow,
             .rightWrist: rightWrist, .rightHip: rightHip,
             .rightKnee: rightKnee, .rightAnkle: rightAnkle]
        return bodyJoints
    }
    
    mutating func setFieldOfName(name: Joint.Name, val: CGPoint){
        switch name {
        case .leftShoulder:
            leftShoulder = val
        case .leftElbow:
            leftElbow = val
        case .leftWrist:
            leftWrist = val
        case .leftHip:
            leftHip = val
        case .leftKnee:
            leftKnee = val
        case .leftAnkle:
            leftAnkle = val
        case .rightShoulder:
            rightShoulder = val
        case .rightElbow:
            rightElbow = val
        case .rightWrist:
            rightWrist = val
        case .rightHip:
            rightHip = val
        case .rightKnee:
            rightKnee = val
        case .rightAnkle:
            rightAnkle = val
        default:
            head = val
        }
    }
    
}
