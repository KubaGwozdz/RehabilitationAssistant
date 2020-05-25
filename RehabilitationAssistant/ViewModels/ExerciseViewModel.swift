//
//  ExerciseViewModel.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 06/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ExerciseViewModel: Identifiable, ObservableObject{
    var id = UUID()
    
    let exercise: Exercise
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
    
    var name: String {
        return self.exercise.name
    }
    
    var description: String {
        return self.exercise.description
    }
    var imageName: String {
        return self.exercise.imageName
    }
    var reps: Int{
        return self.exercise.reps
    }
    
    var startPose: HeadRelatedPose {
        return self.exercise.poses[0]
    }
    
    var actionPose: HeadRelatedPose {
        return self.exercise.poses.last!
    }
    
    var repsCountPoseNum: Int = 0
    
    var repsCountPose: HeadRelatedPose {
        if repsCountPoseNum == -1 {
            return self.exercise.poses.last!
        } else {
            return self.exercise.poses[self.repsCountPoseNum]
        }
    }
    
    func toggleRepsCountPose(){
        self.repsCountPoseNum -= 1
        self.repsCountPoseNum = self.repsCountPoseNum%2
    }
    
}
