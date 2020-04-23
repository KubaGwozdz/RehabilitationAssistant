//
//  TabBar1View.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 22/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct TabBar1: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Text("Trainings")
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.green)
            .onTapGesture {
                self.userData.showFullScreen.toggle()
        }
    }
}

struct TabBar1_Previews: PreviewProvider {
    static var previews: some View {
        TabBar1()
    }
}
