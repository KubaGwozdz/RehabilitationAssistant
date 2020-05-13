//
//  PositionCD+CoreDataProperties.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 10/05/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//
//

import Foundation
import CoreData


extension PositionCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PositionCD> {
        return NSFetchRequest<PositionCD>(entityName: "PositionCD")
    }

    @NSManaged public var x: Double
    @NSManaged public var y: Double

}
