//
//  User.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 28/05/23.
//

import Foundation

struct User : Identifiable, Codable {
    
    var id : UUID
    var isActive : Bool
    var name : String
    var age : Int
    var company : String
    var email : String
    var address : String
    var about : String
    var registered : Date
    var tags : [String]
    var friends : [Friend]
    
    static var example = User(id: UUID(), isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date.now, tags: ["cillum", "consequat", "deserunt", "nostrud", "eiusmod", "minim", "tempor"], friends: [Friend(id: UUID(), name: "Hawkins Patel")])
    
}
