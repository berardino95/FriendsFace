//
//  FriendsListView.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 29/05/23.
//

import SwiftUI

struct FriendsListView: View {
    
    var friends : [Friend]
    
    var body: some View {
        List(friends) { friend in
            Text(friend.name)
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView(friends: [Friend(id: UUID(), name: "John Watson"), Friend(id: UUID(), name: "John Watson"), Friend(id: UUID(), name: "John Watson")])
    }
}
