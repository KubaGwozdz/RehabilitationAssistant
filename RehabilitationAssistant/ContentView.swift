//
//  ContentView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 20/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showedView = "Your trainings"
    
    var body: some View {
        NavigationView{
            ZStack{
                TabView(selection: $showedView) {
                    TrainingsListView()
                        .tabItem {
                            Image("Trainings")
                            Text("Trainings")
                        }.tag("Your trainings")
                    HistoryView()
                        .tabItem {
                            Image("History")
                            Text("History")
                    }.tag("Your history")
                }
            }.navigationBarTitle(Text(showedView))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
