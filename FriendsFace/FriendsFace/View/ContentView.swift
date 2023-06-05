//
//  ContentView.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 28/05/23.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users : FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink{
                    DetailView(user: user)
                } label: {
                    HStack(){
                        IsActiveCircleView(user: user)
                            .frame(width: 10, height: 10)
                        VStack(alignment: .leading){
                            Text(user.wrappedName)
                                .font(.headline)
                            Text(user.wrappedEmail)
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("My Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        for user in users {
                            print(user.name ?? "")
                            print(user.friendArray)
                        }
                        
                    } label: {
                        Text("Print")
                    }
                }
            }
        }
        .task {
            await loadData() //Comment this to test offline mode
        }
    }
    
    func loadData() async {
        
        guard users.isEmpty else { return }
        
        print("Starting load data...")
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedUser = try decoder.decode([User].self, from: data)
            
            await MainActor.run {
                addDataToCoreData(from: decodedUser)
            }
            
        } catch {
            print("Invalid data")
        }
        
    }
    
    func addDataToCoreData(from downloadedUsers : [User]){
        
        for user in downloadedUsers {
            let newUser = CachedUser(context: moc)
            newUser.id = user.id
            newUser.about = user.about
            newUser.adress = user.address
            newUser.age = Int16(user.age)
            newUser.company = user.company
            newUser.email = user.email
            newUser.isActive = user.isActive
            newUser.name = user.name
            newUser.registered = user.registered
            newUser.tag = user.tags.joined(separator: ",")
            
            for friend in user.friends {
                let newFriend = CachedFriend(context: moc)
                newFriend.id = friend.id
                newFriend.name = friend.name
                
                newUser.addToFriends(newFriend)
            }
        }
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
