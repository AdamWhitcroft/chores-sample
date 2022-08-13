//
//  Chore+CoreDataProperties.swift
//  ChoresSample
//
//  Created by Adam Whitcroft on 2022-08-13.
//
//

import Foundation
import CoreData


extension Chore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Chore> {
        return NSFetchRequest<Chore>(entityName: "Chore")
    }

    @NSManaged public var name: String?
    @NSManaged public var updatedDate: Date?
    @NSManaged public var activities: NSSet?
    
    public var unwrappedChoreName: String {
        name ?? "Unknown name"
    }
    
    public var activitiesArray: [Activity] {
        let set = activities as? Set<Activity> ?? []
        
        return set.sorted {
            $0.date! > $1.date!
        }
    }

}

// MARK: Generated accessors for activities
extension Chore {

    @objc(addActivitiesObject:)
    @NSManaged public func addToActivities(_ value: Activity)

    @objc(removeActivitiesObject:)
    @NSManaged public func removeFromActivities(_ value: Activity)

    @objc(addActivities:)
    @NSManaged public func addToActivities(_ values: NSSet)

    @objc(removeActivities:)
    @NSManaged public func removeFromActivities(_ values: NSSet)

}

extension Chore : Identifiable {

}
