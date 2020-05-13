//
//  TrainingView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 06/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct TrainingView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var timeLabel:String = "00:00"
    @State private var timeCounter:Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let training: TrainingViewModel
    
    var cameraView: CameraView? = nil
    
    @State var activeExercise: ExerciseViewModel
    @State private var exerciseCounter = 0
    
    @Binding var trainingFinished: Bool
    
    init(training: TrainingViewModel, activeExercise: ExerciseViewModel, trainingFinished: Binding<Bool>, extra: Bool){
        self.training = training
        self._activeExercise = State(initialValue: activeExercise)
        self._trainingFinished = trainingFinished
    }
    
    init(training: TrainingViewModel, activeExercise: ExerciseViewModel, trainingFinished: Binding<Bool>){
        self.init(training: training, activeExercise: activeExercise, trainingFinished: trainingFinished, extra: false)
        self.cameraView = CameraView(exercise: self.$activeExercise)
    }
    
    func countToTimeString(counter: Int) -> String {
        let seconds = counter % 60
        let minutes = counter / 60
        
        var secondsString = "\(seconds)"
        var minutesString = "\(minutes)"
        
        
        if seconds < 10 {
            secondsString = "0" + secondsString
        }
        
        if minutes < 10 {
            minutesString = "0" + minutesString
        }
        
        if minutes > 60 {
            let hours = minutes / 60
            return "\(hours):\(minutesString):\(secondsString)"
        }
        return "\(minutesString):\(secondsString)"
    }
    
    var body: some View {
        GeometryReader{ metrics in
            VStack {
                HStack(){
                    Button(action:{
                        self.mode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "xmark").foregroundColor(Color.gray)
                    }
                    Spacer()
                    Text(self.training.name)
                    Spacer()
                    Button(action: {
                        self.cameraView!.controller.onCameraButtonTapped()
                        
                    }) {
                        Image(systemName: "camera.rotate").foregroundColor(Color.gray)
                    }
                }.padding(20)
                ZStack{
                    self.cameraView
                    TrainingAssistant(metrics: metrics, time: self.timeLabel,
                                      training: self.training,
                                      cameraView: self.cameraView!,
                                      activeExercise: self.$activeExercise, exerciseCounter: self.$exerciseCounter, trainingFinished: self.$trainingFinished)
                        .frame(width:metrics.size.width*0.95, height: metrics.size.height*0.3)
                        .background(Color("Bolt").opacity(0.5))
                        .cornerRadius(20)
                        .offset(y: metrics.size.height*0.3)
                }
            }.edgesIgnoringSafeArea(.bottom)
                .navigationBarTitle("").navigationBarHidden(true)
                .onAppear(){
                    self.cameraView!.controller.viewDidLoad()
            }
            .onDisappear(){
                self.cameraView!.controller.stop()
                self.timer.upstream.connect().cancel()
            }
        }.onReceive(timer){time in
            self.timeCounter += 1
            self.timeLabel = self.countToTimeString(counter: self.timeCounter)
        }
    }
}


// MARK: TrainingAssistant: View
struct TrainingAssistant: View {
    var doneRepsChanged = NotificationCenter.default.publisher(for: .doneReps)

    let metrics: GeometryProxy
    var time: String
    
    let training: TrainingViewModel
    
    let cameraView: CameraView
    
    @Binding var activeExercise: ExerciseViewModel
    @Binding var exerciseCounter: Int
    @Binding var trainingFinished: Bool
    @State var doneReps = 0
    
    private var nextExerciseName: String {
        if self.exerciseCounter < self.training.exercisesNumber - 1{
            return self.training.exercises[exerciseCounter+1].name
        } else {
            return "You are fininshing!"
        }
    }
    
    
    func nextExercise(){
        self.exerciseCounter += 1
        self.doneReps = 0
        if self.exerciseCounter < self.training.exercisesNumber{
            self.activeExercise = self.training.exercises[self.exerciseCounter]
            cameraView.changeExercise(self.activeExercise)
        } else {
            self.trainingFinished = true
        }
    }
    
    func prevExercise(){
        if self.exerciseCounter > 0{
            self.exerciseCounter -= 1
            self.activeExercise = self.training.exercises[self.exerciseCounter]
            cameraView.changeExercise(self.activeExercise)
        }
    }
    
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: self.prevExercise) {
                Image(systemName: "chevron.compact.left").resizable()
                    .frame(width: metrics.size.width*0.05, height: metrics.size.height*0.15)
                    .foregroundColor(Color.gray.opacity(0.5))
                
            }
            VStack {
                Text(activeExercise.name)
                    .font(.custom("", size:26))
                HStack(alignment: .center){
                    Text("\(doneReps)").font(.headline)
                    Text("/ \(activeExercise.reps) reps").font(.subheadline)
                }.padding(.bottom, 5).padding(.top, 5)
                HStack(alignment: .center){
                    VStack(alignment: .center){
                        Text("Accuracy:")
                            .font(.subheadline)
                        Text("87%")
                            .font(.custom("", size: 25))
                    }.padding(5)
                    VStack(alignment: .center){
                        Text("Time:")
                            .font(.subheadline)
                        Text(time)
                            .font(.custom("", size: 22))
                    }.padding(5)
                }.padding(10)
                Text("Next drill is:")
                    .font(.subheadline)
                Text(self.nextExerciseName).font(.headline)
            }
            .frame(width: metrics.size.width*0.8, height: metrics.size.height*0.3)
            Button(action: self.nextExercise) {
                Image(systemName: "chevron.compact.right").resizable()
                    .frame(width: metrics.size.width*0.05, height: metrics.size.height*0.15)
                    .foregroundColor(Color.gray.opacity(0.5))
            }
        }.onReceive(doneRepsChanged){note in
            self.doneReps = note.userInfo!["doneReps"]! as! Int
            if self.doneReps >= self.activeExercise.reps {
                self.nextExercise()
            }
        }
    }
}


// MARK: Preview
struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(training: TrainingViewModel(training: Training(name: "Knee Training", description: "Super hard", exercises: [
            Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides", reps: 20),
            Exercise(name: "Shoulder taps", description: "Stand in the high plank position and tap your shoulders", reps: 30)
        ])), activeExercise: ExerciseViewModel(exercise: Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides", reps: 20)), trainingFinished: .constant(false))
    }
}

