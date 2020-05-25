//
//  TrainingViewManager.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 23/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI
import AVFoundation

struct TrainingViewManager: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    let training: TrainingViewModel

    @State var isCountdownFinished = false
    @State var trainingFinished = false
    
    
    var body: some View {
        ZStack{
            if isCountdownFinished{
                if trainingFinished{
                    TrainingFinished(training: self.training)
                } else {
                    TrainingView(training: training, activeExercise: training.exercises[0], trainingFinished: self.$trainingFinished)
                }
            } else {
                CountdownView(isCountDownFinished: $isCountdownFinished)
            }
        }
    }
}

struct TrainingViewManager_Previews: PreviewProvider {
    static var previews: some View {
        TrainingViewManager(training: TrainingViewModel(training: Training(name: "Knee Training", description: "Super hard", exercises: [Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides", reps:10, poses: [])])))
    }
}

