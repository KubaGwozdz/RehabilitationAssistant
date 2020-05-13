//
//  PoseCD+CoreDataProperties.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 10/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//
//

import Foundation
import CoreData


extension PoseCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PoseCD> {
        return NSFetchRequest<PoseCD>(entityName: "PoseCD")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var head: PositionCD?
    @NSManaged public var leftShoulder: PositionCD?
    @NSManaged public var rightShoulder: PositionCD?
    @NSManaged public var leftElbow: PositionCD?
    @NSManaged public var rightElbow: PositionCD?
    @NSManaged public var leftWrist: PositionCD?
    @NSManaged public var rightWrist: PositionCD?
    @NSManaged public var leftHip: PositionCD?
    @NSManaged public var rightHip: PositionCD?
    @NSManaged public var leftKnee: PositionCD?
    @NSManaged public var rightKnee: PositionCD?
    @NSManaged public var leftAnkle: PositionCD?
    @NSManaged public var rightAnkle: PositionCD?

}
