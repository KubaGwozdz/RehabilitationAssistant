//
//  ExercisesListView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 22/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct ExercisesListView: View {
    let training: TrainingViewModel

    var body: some View {
        List(training.exercises){ exercise in
            ExerciseCell(exercise: exercise)
        }
    }
}


struct ExerciseCell: View {
    let exercise: ExerciseViewModel
    
    var body: some View {
            HStack(spacing: 50) {
                Image(exercise.imageName).resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 100)
                VStack(alignment: .leading) {
                    Text(exercise.name)
                        .font(.headline)
                    Text(exercise.description)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
            
        }
    }
}



//struct ExercisesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExercisesListView()
//    }
//}

