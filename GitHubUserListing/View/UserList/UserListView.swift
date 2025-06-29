//
//  UserListView.swift
//  GitHubUserListing
//
//  Created by Luna on 28/06/2025.
//

import SwiftUI

struct UserListView: View {
    
    @State private var viewModel = UserListViewModel()
    
    var body: some View {
        NavigationStack {
            switch viewModel.screenState {
            case .ready:
                mainView
            case .loading:
                ProgressView()
            case .error:
                GenericErrorView()
            }
        }
        .tint(.black)
        .task {
            await viewModel.fetchUsers()
        }
    }
    
    var mainView: some View {
        VStack(alignment: .leading) {
            userList
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(viewModel.copy.navigationTitle)
    }
    
    var userList: some View {
        ScrollView {
            ForEach(viewModel.users, id: \.login){ user in
                userCell(for: user)
            }
        }
    }
    
    @ViewBuilder
    func userCell(for user: User) -> some View {
        NavigationLink(
            destination: { UserRepositoryView(username: user.login) },
            label: {
                UserListingCell(user: user)
                    .defaultPadding()
            }
        )
        Divider()
    }
}

#Preview {
    UserListView()
}
