//
//  Exercise.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 22/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import SwiftUI

struct Exercise {
    var name: String
    var description: String
    var imageName: String { return name }
    var reps: Int
    
    var poses: [HeadRelatedPose]
    
    
    
}


