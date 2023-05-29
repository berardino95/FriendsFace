//
//  DetailView.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 28/05/23.
//

import SwiftUI

struct DetailView: View {
    
    var user : User
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 10){
                
                ProfilePictureView()
                
                HStack{
                    IsActiveCircleView(user: user)
                        .frame(width: 10)
                    Text(user.isActive ? "online" : "offline")
                }
                
                Text("Registered on \(user.registered.formatted(date: .abbreviated, time: .omitted))")
                
                Text("email: \(user.email)")
                
                Text(user.address)
                    .multilineTextAlignment(.center)
                
                Text(user.about)
                    .padding(.horizontal)
                
                NavigationLink {
                    FriendsListView(friends: user.friends)
                } label: {
                    Text("See \(user.name) friends")
                }
            }
            .navigationTitle(user.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User.example)
    }
}
