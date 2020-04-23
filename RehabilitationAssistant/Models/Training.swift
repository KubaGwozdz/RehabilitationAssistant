//
//  Training.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 21/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//
import SwiftUI

struct Training: Identifiable {
    var id = UUID()
    
    var name: String
    var description: String
    var imageName: String { return name }
    
    var exercises: [Exercise]
    
}

#if DEBUG
let testData = [
    Training(name: "Knee Training", description: "Super hard", exercises: [Exercise(name: "Knee Hugs", description: "Hold your knee for one or two seconds and then switch sides")])
]
#endif

struct Training_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
