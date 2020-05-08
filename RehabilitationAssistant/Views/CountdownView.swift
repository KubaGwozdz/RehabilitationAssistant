//
//  CountdownView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 06/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct CountdownView: View {
    @Binding var isCountDownFinished: Bool
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 4
    @State private var label = ""
    @State private var size:CGFloat = 150
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Spacer()
                Text(label)
                    .font(.custom("Verdana", size: self.size))
                    .foregroundColor(Color.white)
                    .onReceive(timer){time in
                        if self.counter == 1{
                            self.size = 100
                            self.label = "START"
                            self.counter -= 1
                        }else if self.counter == 0{
                            self.timer.upstream.connect().cancel()
                            self.isCountDownFinished = true
                        } else {
                            self.counter -= 1
                            self.label = String(self.counter)
                        }
                }
                .shadow(radius: 10)
                Spacer()
            }
            Spacer()
        }.background(Color("Bolt"))
            .edgesIgnoringSafeArea(.all)
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(isCountDownFinished: .constant(false))
    }
}
