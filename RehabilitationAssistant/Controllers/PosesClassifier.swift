

//
//  File.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 23/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation

class PosesClassifier{
    static private let threshold: Double = 1.5

    static func checkIfPosesMatch(pose: HeadRelatedPose, exercisePose: HeadRelatedPose) -> Bool {
        for (name, position) in pose.getBodyJoints(){
            let distance = position.distance(to: exercisePose.getBodyJoints()[name]!)
            print("DISTANCE to \(name): \(distance)")
            if distance > threshold {
                return false
            }
        }
        return true
    }
    
    
    
}
