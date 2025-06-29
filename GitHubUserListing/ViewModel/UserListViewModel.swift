//
//  UserListViewModel.swift
//  GitHubUserListing
//
//  Created by Luna on 29/06/2025.
//

import SwiftUI

@Observable final class UserListViewModel {
    struct Copy {
        let navigationTitle = "User List"
    }
    
    let copy = Copy()
    var screenState: ScreenState = .loading
    var users: [User] = []
    
    func fetchUsers() async {
        do {
            users = try await APIService.shared.getUserListing()
            screenState = .ready
        } catch {
            screenState = .error
        }
    }
}
