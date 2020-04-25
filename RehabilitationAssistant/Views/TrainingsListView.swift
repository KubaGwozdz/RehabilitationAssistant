//
//  TrainingsListView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 21/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct TrainingsListView: View {    
    var trainings: [Training] = testData
    
    var body: some View {
            List(trainings){ training in
                TrainingCell(training: training)
            }
    }
}


#if DEBUG
struct TrainingsListView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsListView(trainings: testData)
    }
}
#endif

struct TrainingCell: View {
    let training: Training
    
    var body: some View {
        NavigationLink(destination: TrainingMenuView(training: training)){
            HStack() {
                Image(training.imageName).resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 100)
                    .padding(.leading, 30)
                    .padding(.trailing, 40)
                VStack(alignment: .leading) {
                    Text(training.name)
                        .font(.headline)
                    Text(training.description)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}
