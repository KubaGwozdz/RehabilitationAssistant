//
//  Trainer.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 10/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import CoreGraphics


class Trainer {
    
    func showPose(pose: Pose){
        print("POSE:")
        for (name, joint) in pose.joints{
            print("\(name): \(joint.position)")
        }
    }
}
