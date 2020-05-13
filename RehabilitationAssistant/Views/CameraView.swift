//
//  CameraView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 23/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

struct CameraView : UIViewControllerRepresentable {
    @Binding var exercise: ExerciseViewModel
    
    let controller = VisionController()
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> VisionController {
        controller.exercise = exercise
        return controller
    }
    
    func updateUIViewController(_ uiViewController: VisionController, context: UIViewControllerRepresentableContext<CameraView>) {
    }
    
    func changeExercise(_ exercise: ExerciseViewModel){
        controller.exercise = exercise
        controller.doneReps = 0
    }
}

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
