//
//  ContentView.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 28/05/23.
//

import SwiftUI

struct ContentView: View {

    @State private var users = [User]()
    
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
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("My Friends")
        }
        .task {
            await loadData()
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
            if let decodeData = try? decoder.decode([User].self, from: data) {
                users = decodeData
            }
        } catch {
            print("Invalid data")
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
