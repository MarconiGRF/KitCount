//
//  Kounter+CoreDataProperties.swift
//  KitCount
//
//  Created by Marconi Gomes on 06/09/22.
//
//

import Foundation
import CoreData


extension Kounter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kounter> {
        return NSFetchRequest<Kounter>(entityName: "Kounter")
    }

    @NSManaged public var creation: Date
    @NSManaged public var desc: String?
    @NSManaged public var goal: Int32
    @NSManaged public var name: String
    @NSManaged public var value: Int32
    @NSManaged public var isReverse: Bool
    
    @objc var hasDesc: Bool {
        if let unwrapped = desc {
            return !unwrapped.isEmpty
        } else {
            return false
        }
    }
}

extension Kounter : Identifiable {}

extension Kounter {
    static func generateMocks(in context: NSManagedObjectContext) throws {
        let names = [
            "1 - Mocky by generateMocks",
            "2 - Mocky by generateMocks",
            "3 - Mocky by generateMocks"
        ]
        
        let values = [
            12,
            3,
            178
        ]
        
        let goals = [
            36,
            10,
            200
        ]
        
        
        for (index, name) in names.enumerated() {
            let newKounter = Kounter(context: context)
            newKounter.name = name
            newKounter.value = Int32(exactly: values[index])!
            newKounter.goal = Int32(exactly: goals[index])!
            newKounter.creation = Date()
            newKounter.isReverse = false
            newKounter.desc = "Kounter created automatically by PersCtrll"
        }

        try context.save()
    }
    
    static func getMocked() -> Kounter {
        let newKounter = Kounter(context: PersistenceController.shared.persistentContainer.viewContext)
        newKounter.name = "0 - Mocky by getMocked"
        newKounter.value = 12
        newKounter.goal = 24
        newKounter.creation = Date()
        newKounter.isReverse = false
        newKounter.desc = "Dragon Ipsum Lorem Mocked"
        
        return newKounter
    }
}
