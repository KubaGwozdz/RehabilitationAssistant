//
//  TrainingViewModel.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 06/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import SwiftUI

struct TrainingViewModel: Identifiable {
    var id = UUID()
    
    let training: Training
    
    init(training: Training) {
        self.training = training
    }
    
    var name: String {
        return self.training.name
    }
    
    var description: String {
        return self.training.description
    }
    
    var imageName: String {
        return self.training.imageName
        
    }
    
    var exercises: [ExerciseViewModel] {
        return self.training.exercises.map{ExerciseViewModel(exercise: $0)}
    }
    
    var exercisesNumber: Int {
        return self.exercises.count
    }
    
}

#if DEBUG
let testData = [
    TrainingViewModel(training:
        Training(name: "Knee Training", description: "After ACL injury", exercises: [
            Exercise(name: "Right hand over hand", description: "Rise your right hand over head", reps:10,
                     poses: [
                        HeadRelatedPose(
                            leftShoulder: CGPoint(x: 0.6, y:0.85),
                            leftElbow: CGPoint(x: 0.93, y: 1.8),
                            leftWrist: CGPoint(x: 1.12, y: 2.75),
                            leftHip: CGPoint(x: 0.49, y: 3),
                            leftKnee: CGPoint(x: 0.43, y: 4.54),
                            leftAnkle: CGPoint(x: 0.47, y: 5.69),
                            rightShoulder: CGPoint(x: -0.65, y:0.9),
                            rightElbow: CGPoint(x: -0.88, y:1.86),
                            rightWrist: CGPoint(x: -0.99, y:2.75),
                            rightHip: CGPoint(x: -0.34, y:3.03),
                            rightKnee: CGPoint(x: -0.25, y:4.52),
                            rightAnkle: CGPoint(x: -0.15,y: 5.42)),
                        HeadRelatedPose(
                            leftShoulder: CGPoint(x: 0.5, y:0.7),
                            leftElbow: CGPoint(x: 0.78, y: 1.6),
                            leftWrist: CGPoint(x: 0.92, y: 2.35),
                            leftHip: CGPoint(x: 0.37, y: 2.62),
                            leftKnee: CGPoint(x: 0.39, y: 4.15),
                            leftAnkle: CGPoint(x: 0.48, y: 5.27),
                            rightShoulder: CGPoint(x: -0.48, y:0.63),
                            rightElbow: CGPoint(x: -1.09, y:-0.16),
                            rightWrist: CGPoint(x: -1.23, y: -1.33),
                            rightHip: CGPoint(x: -0.38, y:2.64),
                            rightKnee: CGPoint(x: -0.31, y:4.1),
                            rightAnkle: CGPoint(x: -0.21,y: 5.09))
                        
            ]),
            Exercise(name: "Left hand over hand", description: "Rise your left hand over head", reps:10,
                     poses: [
                        HeadRelatedPose(
                            leftShoulder: CGPoint(x: 0.6, y:0.85),
                            leftElbow: CGPoint(x: 0.93, y: 1.8),
                            leftWrist: CGPoint(x: 1.12, y: 2.75),
                            leftHip: CGPoint(x: 0.49, y: 3),
                            leftKnee: CGPoint(x: 0.43, y: 4.54),
                            leftAnkle: CGPoint(x: 0.47, y: 5.69),
                            rightShoulder: CGPoint(x: -0.65, y:0.9),
                            rightElbow: CGPoint(x: -0.88, y:1.86),
                            rightWrist: CGPoint(x: -0.99, y:2.75),
                            rightHip: CGPoint(x: -0.34, y:3.03),
                            rightKnee: CGPoint(x: -0.25, y:4.52),
                            rightAnkle: CGPoint(x: -0.15,y: 5.42)),
                        HeadRelatedPose(
                            leftShoulder: CGPoint(x: 0.5, y:0.7),
                            leftElbow: CGPoint(x: 0.78, y: -0.16),
                            leftWrist: CGPoint(x: 0.92, y: -1.33),
                            leftHip: CGPoint(x: 0.37, y: 2.62),
                            leftKnee: CGPoint(x: 0.39, y: 4.15),
                            leftAnkle: CGPoint(x: 0.48, y: 5.27),
                            rightShoulder: CGPoint(x: -0.48, y:0.63),
                            rightElbow: CGPoint(x: -1.09, y:1.6),
                            rightWrist: CGPoint(x: -1.23, y: 2.35),
                            rightHip: CGPoint(x: -0.38, y:2.64),
                            rightKnee: CGPoint(x: -0.31, y:4.1),
                            rightAnkle: CGPoint(x: -0.21,y: 5.09))
                        
            ]),
            Exercise(name: "Squats", description: "Squat down as low as you can, keeping your head and chest lifted", reps:5,
                     poses: [
                        HeadRelatedPose(
                            leftShoulder: CGPoint(x: 0.6, y:0.9),
                            leftElbow: CGPoint(x: 1.4, y: 0.8),
                            leftWrist: CGPoint(x: 1.84, y: -0.27),
                            leftHip: CGPoint(x: 0.42, y: 3.1),
                            leftKnee: CGPoint(x: 0.3, y: 4.7),
                            leftAnkle: CGPoint(x: 0.62, y: 5.97),
                            rightShoulder: CGPoint(x: -0.66, y:0.9),
                            rightElbow: CGPoint(x: -1.34, y:0.7),
                            rightWrist: CGPoint(x: -1.93, y: -0.08),
                            rightHip: CGPoint(x: -0.4, y: 3.2),
                            rightKnee: CGPoint(x: -0.23, y:4.61),
                            rightAnkle: CGPoint(x: -0.46,y: 5.95)),
                        
                        HeadRelatedPose(
                            leftShoulder: CGPoint(x: 1.22, y:1.24),
                            leftElbow: CGPoint(x: 3.01, y: 2.03),
                            leftWrist: CGPoint(x: 4.38, y: 0.73),
                            leftHip: CGPoint(x: 0.84, y: 4.67),
                            leftKnee: CGPoint(x: 2.32, y: 5.52),
                            leftAnkle: CGPoint(x: 1.36, y: 7.4),
                            rightShoulder: CGPoint(x: -1.36, y:1.36),
                            rightElbow: CGPoint(x: -3.1, y:1.64),
                            rightWrist: CGPoint(x: -5.2, y: 1.17),
                            rightHip: CGPoint(x: -0.62, y:4.78),
                            rightKnee: CGPoint(x: -2.03, y:4.26),
                            rightAnkle: CGPoint(x: -0.7,y: 7.4))
                        
            ]),
            Exercise(name: "Situps", description: "Lie down on your back, lift your torso and sit up", reps:15,
                     poses: [
                        HeadRelatedPose(
                            leftShoulder: CGPoint(x: 0.8, y:1.12),
                            leftElbow: CGPoint(x: 2.6, y: 1.25),
                            leftWrist: CGPoint(x: 1.25, y: 0.21),
                            leftHip: CGPoint(x: 0.41, y: 4.01),
                            leftKnee: CGPoint(x: 1.53, y: 2.96),
                            leftAnkle: CGPoint(x: 0.81, y: 6.4),
                            rightShoulder: CGPoint(x: -1.01, y: 1.03),
                            rightElbow: CGPoint(x: -2.65, y: 1.18),
                            rightWrist: CGPoint(x: -1.08, y: 0.05),
                            rightHip: CGPoint(x: -0.67, y: 4.01),
                            rightKnee: CGPoint(x: -1.66, y: 2.95),
                            rightAnkle: CGPoint(x: -0.96,y: 6.48)),
                        
                        HeadRelatedPose(
                            leftShoulder: CGPoint(x: 0.41, y: 0.61),
                            leftElbow: CGPoint(x: 1.23, y: 0.41),
                            leftWrist: CGPoint(x: 0.72, y: 0.13),
                            leftHip: CGPoint(x: 0.38, y: 1.68),
                            leftKnee: CGPoint(x: 1.42, y: 0.62),
                            leftAnkle: CGPoint(x: 1.07, y: 3.62),
                            rightShoulder: CGPoint(x: -0.57, y:0.52),
                            rightElbow: CGPoint(x: -1.31, y: 0.28),
                            rightWrist: CGPoint(x: -0.61, y: 0.18),
                            rightHip: CGPoint(x: -0.32, y: 1.89),
                            rightKnee: CGPoint(x: -0.8, y: 0.45),
                            rightAnkle: CGPoint(x: -0.96,y: 3.6))
                        
            ])
            
        
            
        ])
    )
]
#endif

//            Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides", reps:20),
//            Exercise(name: "Shoulder Taps", description: "Stand in the high plank position and tap your sholders", reps:10)
