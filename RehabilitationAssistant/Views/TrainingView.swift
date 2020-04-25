//
//  TrainingView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 23/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI
import AVFoundation

struct TrainingView: View {
    let training: Training
    @Binding var showingTraining: Bool

    let session = AVCaptureSession()
    
    var body: some View {
        VStack {
            HStack(){
                Spacer()
                Button(action:{
                    self.showingTraining.toggle()
                }){
                    Image(systemName: "xmark").foregroundColor(Color.gray)
                }
            }.padding(20)
            Text(self.training.name).offset(y: -45)
            CameraView()
//            Image(uiImage: PoseImageView)
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(training: Training(name: "Knee Training", description: "Super hard", exercises: [Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides")]),
            showingTraining: .constant(true))
    }
}
