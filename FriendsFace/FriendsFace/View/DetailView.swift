//
//  DetailView.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 28/05/23.
//

import SwiftUI

struct DetailView: View {
    
    var user : CachedUser
    
    var body: some View {
        List{
            HStack{
                Spacer()
                ProfilePictureView(user: user)
                Spacer()
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            Section {
                Text(user.wrappedAbout)
            } header: {
                Text("About")
            }
            
            Section{
                Text("Email: \(user.wrappedEmail)")
                Text("Address \(user.wrappedAddress)")
                Text("Company: \(user.wrappedCompany)")
            } header: {
                Text("Info")
            }
            
            Section{
                ForEach(user.friendArray) { friend in
                    Text(friend.wrappedName)
                }
            } header: {
                Text("\(user.wrappedName) friends")
            }
        }
            .background(Color(.systemGray6))
            .listStyle(.grouped)
            .navigationTitle(user.wrappedName)
            .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            DetailView(user: User.example)
//        }
//    }
//}
