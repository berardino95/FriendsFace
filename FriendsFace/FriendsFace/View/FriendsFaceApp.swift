//
//  FriendsFaceApp.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 28/05/23.
//

import SwiftUI

@main
struct FriendsFaceApp: App {
    
    //Creating an instance of Data Controller class and inject it into the app
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
