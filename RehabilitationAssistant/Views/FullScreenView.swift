//
//  FullScreenView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 22/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct FullScreenView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Text("FullScreen")
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.red)
            .onTapGesture {
                self.userData.showFullScreen.toggle()
        }
    }
}

struct FullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenView()
    }
}
