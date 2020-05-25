//
//  TrainingFinished.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 08/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct TrainingFinished: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let training: TrainingViewModel
    
    var body: some View {
        GeometryReader{ metrics in
            VStack {
                Image(self.training.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: metrics.size.height*0.5)
                    .padding(.bottom)
                Text("Well done!")
                    .font(.custom("", size: 50))
                    .foregroundColor(Color.blue)
                Text("You've just finished").foregroundColor(Color.gray)
                Text(self.training.name).font(.custom("", size: 40))
                Text(self.training.description).font(.custom("", size: 20))
                
                Button(action: {
                    self.mode.wrappedValue.dismiss()

                }) {
                    VStack(alignment: .center) {
                        Text("Finish")
                            .padding(40)
                            .background(Color("Bolt"))
                            .foregroundColor(Color.gray)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .font(.title)
                            .padding(50)
                    }
                }
                Spacer()
                HStack{
                    Spacer()
                }
            }
            .background(Color(.white))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TrainingFinished_Previews: PreviewProvider {
    static var previews: some View {
        TrainingFinished(training: TrainingViewModel(training: Training(name: "Knee Training", description: "Training focused on your knees", exercises: [Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides", reps:10, poses: [])]))
        )
    }
}
