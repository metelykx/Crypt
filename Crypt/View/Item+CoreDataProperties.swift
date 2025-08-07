//
//  Item+CoreDataProperties.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 06.08.2025.
//

import Foundation
import CoreData

extension Item {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var repeatPass: String?
}
