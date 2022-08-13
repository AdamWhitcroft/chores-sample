//
//  Activity+CoreDataProperties.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity")
    }

    @NSManaged public var entry: String?
    @NSManaged public var date: Date?
    @NSManaged public var chore: Chore?
    
    public var unwrappedChoreEntry: String {
        entry ?? "Unknown note"
    }

}

extension Activity : Identifiable {

}
