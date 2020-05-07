//
//  TrainingView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 06/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct TrainingView: View {
    let training: TrainingViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let cameraView: CameraView = CameraView()
    
    var body: some View {
        VStack {
            HStack(){
                Button(action: {
                    self.cameraView.controller.onCameraButtonTapped()
                    
                }) {
                    Image(systemName: "camera.rotate").foregroundColor(Color.gray)
                }
                Spacer()
                Button(action:{
                    self.mode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark").foregroundColor(Color.gray)
                }
            }.padding(20)
            Text(self.training.name).offset(y: -45)
            self.cameraView
        }.edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("").navigationBarHidden(true)
            .onAppear(){
                self.cameraView.controller.viewDidLoad()
        }
        .onDisappear(){
            self.cameraView.controller.stop()
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(training: TrainingViewModel(training: Training(name: "Knee Training", description: "Super hard", exercises: [Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides")])))
    }
}

