//
//  PoseBuilderConfiguration.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 25/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import CoreGraphics

struct PoseBuilderConfiguration {
    /// The minimum value for valid joints in a pose.
    var jointConfidenceThreshold = 0.1

    /// The minimum value for a valid pose.
    var poseConfidenceThreshold = 0.5
}
