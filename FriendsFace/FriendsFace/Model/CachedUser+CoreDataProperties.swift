//
//  CachedUser+CoreDataProperties.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 30/05/23.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var adress: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tag: String?
    @NSManaged public var friends: NSSet?
    
    var wrappedName : String {
        name ?? "Unknown name"
    }
    var wrappedCompany : String {
        company ?? "Unknown company"
    }
    var wrappedEmail : String {
        email ?? "Unknown name"
    }
    var wrappedAddress : String {
        adress ?? "Unknown address"
    }
    var wrappedAbout : String {
        about ?? "Unknown about"
    }
    var wrappedRegisteredDate : Date {
        registered ?? Date.now
    }
    var tagArray : [String] {
        tag?.components(separatedBy: ",") ?? ["no tag"]
    }
    
    var nameLetter : String {
        var nameLetter = ""
        let nameArray = wrappedName.split(separator: " ")
        for word in nameArray {
            nameLetter += String(word.first!)
        }
        return nameLetter
    }
    
    public var friendArray : [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        return set.sorted{
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
