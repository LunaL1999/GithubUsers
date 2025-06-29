//
//  UserRepositoryViewModel.swift
//  GitHubUserListing
//
//  Created by Luna on 29/06/2025.
//

import SwiftUI

@Observable final class UserRepositoryViewModel {
    struct Copy {
        let followersLabel = "Followers: "
        let followingLabel = "Following: "
    }
    
    let username: String
    let copy = Copy()
    var screenState: ScreenState = .loading
    var userDetails: UserDetails?
    var repositories: [Repository] = []
    
    init(username: String) {
        self.username = username
    }
    
    var nameFieldValue: String {
        if let name = userDetails?.name {
            return name
        } else {
            return username
        }
    }
    
    func fetchDetails() async {
        do {
            userDetails = try await APIService.shared.getUserDetails(for: username)
            repositories = try await APIService.shared.getUserRepositories(for: username).filter { !$0.fork }
            screenState = .ready
        } catch {
            screenState = .error
        }
    }
}
