//
//  ProfilePictures.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 28/05/23.
//

import SwiftUI

struct ProfilePictureView: View {
    
    var user: User
    
    var body: some View {
        Circle()
            .fill(.gray)
            .frame(width: 150, height: 150)
            .overlay {
                Text(user.nameLetter)
                    .font(.system(size: 80))
                    .foregroundColor(.white)
            }
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView(user: User.example)
    }
}
