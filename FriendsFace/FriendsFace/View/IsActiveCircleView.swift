//
//  IsActiveCircleView.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 28/05/23.
//

import SwiftUI

struct IsActiveCircleView: View {
    
    let user : CachedUser
    
    var body: some View {
        Circle()
            .fill(user.isActive ? Color.green : Color.gray)
    }
}

//struct IsActiveCircleView_Previews: PreviewProvider {
//    static var previews: some View {
//        IsActiveCircleView(user: User.example)
//    }
//}
