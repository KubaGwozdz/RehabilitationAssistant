//
//  Head.swift
//  RehabilitationAssistant
//
//  Created by Julia Żur on 11/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import CoreGraphics

struct Head {
    
    var headParts:[Joint.Name] = [.nose, .leftEye, .rightEye, .leftEar, .rightEar]
    
    func getMeanHeadPosition(joints: [Joint]) -> CGPoint {
        
        var meanXPosition = CGFloat(0)
        var meanYPosition = CGFloat(0)
        
        for joint in joints {
                        
            meanXPosition += joint.position.x
            meanYPosition += joint.position.y
            
        }
        
        if joints.count == 0{
            return CGPoint(x:0, y:0)
        } else {
            let meanHeadPosition = CGPoint(x: meanXPosition/CGFloat(joints.count), y: meanYPosition/CGFloat(joints.count))
            return meanHeadPosition
        }
        
    }
    
}
