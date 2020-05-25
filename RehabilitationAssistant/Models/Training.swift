//
//  Training.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 21/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//
import SwiftUI
import Foundation

struct Training {
    var name: String
    var description: String
    var imageName: String { return name }
    
    var exercises: [Exercise]
    
}
