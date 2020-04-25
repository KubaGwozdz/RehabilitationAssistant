//
//  TrainingMenuView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 21/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct TrainingMenuView: View {
    let training: Training
    @State var showingTraining = false
    
    var body: some View {
        GeometryReader{ metrics in
            ZStack{
                VStack(alignment: .center) {
                    Image(self.training.imageName)
                        .resizable().aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: metrics.size.height*0.3)
                    StartButton(training: self.training, showingTraining: self.$showingTraining)
                        .offset(y: -metrics.size.height*0.3)
                        .padding(.bottom, -metrics.size.height*0.3)
                    ExercisesListView(training: self.training)
                    Spacer()
                }.sheet(isPresented: self.$showingTraining){
                    TrainingView(training: self.training,
                                 showingTraining: self.$showingTraining)
                }
            }
        }
    }
}

struct StartButton: View {
    let training: Training
    @Binding var showingTraining: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                withAnimation{
                    self.showingTraining.toggle()
                }
            }) {
                Text("Start")
                    .padding(40)
                    .background(Color("StartBtnClr"))
                    .foregroundColor(Color.black)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .font(.title)
                
            }.padding(20)
            
            Text(training.name)
                .font(.title)
                .foregroundColor(Color.white)
            Text(training.description)
                .font(.subheadline).foregroundColor(Color.white)
        }
    }
}

struct TrainingMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingMenuView(training: Training(name: "Knee Training", description: "Super hard", exercises: [Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides")]))
    }
}

