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
        List{
            HStack{
                Spacer()
                ProfilePictureView(user: user)
                Spacer()
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            Section {
                Text(user.about)
            } header: {
                Text("About")
            }
            
            Section{
                Text("Email: \(user.email)")
                Text("Address \(user.address)")
                Text("Company: \(user.company)")
            } header: {
                Text("Info")
            }
            
            Section{
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            } header: {
                Text("\(user.name) friends")
            }
        }
            .background(Color(.systemGray6))
            .listStyle(.grouped)
            .navigationTitle(user.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(user: User.example)
        }
    }
}
