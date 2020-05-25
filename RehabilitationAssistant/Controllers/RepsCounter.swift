//
//  ExerciseQualifier.swift
//  RehabilitationAssistant
//
//  Created by Julia Żur on 11/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation


class RepsCounter {
    var doneReps: Int = 0{
      didSet {
        let userinfo: [String: Int] = ["doneReps": self.doneReps]
        NotificationCenter.default.post(Notification(name: .doneReps,
                                                     object: nil,
                                                     userInfo: userinfo))
      }
    }
    
    
    private var foundPoses = 0
    
    weak var exercise: ExerciseViewModel?
    
    func setExercise(_ exercise: ExerciseViewModel){
        self.exercise = exercise
        self.doneReps = 0
        self.foundPoses = 0
        print(exercise.name)
    }
    
    func count(_ hrPose: HeadRelatedPose){
        let match = PosesClassifier.checkIfPosesMatch(pose: hrPose, exercisePose: exercise!.repsCountPose)
        print("POSES match: \(match)")
        if match{
            print("POSES MATCH!")
            exercise!.toggleRepsCountPose()
            foundPoses += 1
            if foundPoses%2 == 0 {
                doneReps += 1
            }
        }
    }
    
    
    
    
    
}
