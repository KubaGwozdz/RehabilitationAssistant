//
//  TrainingMenuView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 21/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct TrainingMenuView: View {
    let training: TrainingViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    var body: some View {
        GeometryReader{ metrics in
            NavigationView(){
                ZStack{
                    VStack(alignment: .center) {
                        Image(self.training.imageName)
                            .resizable().aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.top)
                            .frame(height: metrics.size.height*0.3)
                        Button(action: {
                            self.mode.wrappedValue.dismiss()
                            
                        }) {
                            HStack{
                                Image(systemName: "chevron.left")
                                Text("Your trainings")
                            }
                        }.offset(y: -metrics.size.height*0.3).padding(.leading, -metrics.size.width*0.48)
                        VStack(){
                            NavigationLink(destination: TrainingViewManager(training: self.training)){
                                StartButton()
                            }
                            Text(self.training.name)
                                .font(.title)
                                .foregroundColor(Color.white)
                            Text(self.training.description)
                                .font(.subheadline).foregroundColor(Color.white)
                        }.offset(y: -metrics.size.height*0.3)
                            .padding(.bottom, -metrics.size.height*0.3)
                        ExercisesListView(training: self.training)
                        Spacer()
                    }
                }.navigationBarTitle("").navigationBarHidden(true)
            }.navigationBarTitle("").navigationBarHidden(true)
        }
    }
}


struct StartButton: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Start")
                .padding(40)
                .background(Color("Bolt"))
                .foregroundColor(Color.black)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .font(.title)
                .padding(20)
        }
    }
}

struct TrainingMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingMenuView(training: TrainingViewModel(training: Training(name: "Knee Training", description: "Super hard", exercises: [Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides")]))
        )
    }
}



