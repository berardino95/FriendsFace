//
//  CachedFriend+CoreDataProperties.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 30/05/23.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var users: CachedUser?

}

extension CachedFriend : Identifiable {

}
