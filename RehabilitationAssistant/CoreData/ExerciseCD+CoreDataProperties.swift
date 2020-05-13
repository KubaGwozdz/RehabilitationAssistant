//
//  ExerciseCD+CoreDataProperties.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 10/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//
//

import Foundation
import CoreData


extension ExerciseCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseCD> {
        return NSFetchRequest<ExerciseCD>(entityName: "ExerciseCD")
    }

    @NSManaged public var exerciseDescription: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var reps: Int16
    @NSManaged public var startPose: PoseCD?
    @NSManaged public var actionPose: PoseCD?

}
