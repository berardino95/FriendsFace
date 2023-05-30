//
//  DataController.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 30/05/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    //Telling witch data model the app should use
    let container = NSPersistentContainer(name : "FriendsFace")
    
    init(){
        //loading data from the persistentStore
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
}
