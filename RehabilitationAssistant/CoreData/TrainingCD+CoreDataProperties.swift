//
//  TrainingCD+CoreDataProperties.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 10/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//
//

import Foundation
import CoreData


extension TrainingCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrainingCD> {
        return NSFetchRequest<TrainingCD>(entityName: "TrainingCD")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var trainingDescription: String?
    @NSManaged public var exercises: NSSet?

}

// MARK: Generated accessors for exercises
extension TrainingCD {

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: ExerciseCD)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: ExerciseCD)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSSet)

}
