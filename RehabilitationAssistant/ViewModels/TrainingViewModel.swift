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
        Training(name: "Knee Training", description: "Super hard", exercises: [Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides", reps:20)])
    )
]
#endif

