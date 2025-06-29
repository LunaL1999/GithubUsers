//
//  UserListingCell.swift
//  GitHubUserListing
//
//  Created by Luna on 28/06/2025.
//

import SwiftUI
import Kingfisher

struct UserListingCell: View {
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            userImage
            Text(user.login)
                .font(.headline)
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
    
    @ViewBuilder
    var userImage: some View {
        if let url = URL(string: user.avatarUrl) {
            KFImage(url)
                .resizable()
                .background(.white)
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        }
    }
}
