//
//  ProfilePictures.swift
//  FriendsFace
//
//  Created by Berardino Chiarello on 28/05/23.
//

import SwiftUI

struct ProfilePictureView: View {
    var body: some View {
        Circle()
            .fill(.gray)
            .frame(width: 150, height: 150)
            .padding()
            .overlay {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
            }
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView()
    }
}
