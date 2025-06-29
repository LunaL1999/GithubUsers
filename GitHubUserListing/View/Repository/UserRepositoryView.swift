//
//  UserRepositoryView.swift
//  GitHubUserListing
//
//  Created by Luna on 28/06/2025.
//

import SwiftUI
import Kingfisher

struct UserRepositoryView: View {
    
    @State private var viewModel: UserRepositoryViewModel
    
    init(username: String) {
        self._viewModel = State(wrappedValue: UserRepositoryViewModel(username: username))
    }
    
    var body: some View {
        Group {
            switch viewModel.screenState {
            case .ready:
                mainView
            case .loading:
                ProgressView()
            case .error:
                GenericErrorView()
            }
        }
        .task {
            await viewModel.fetchDetails()
        }
    }
    
    var mainView: some View {
        ScrollView {
            VStack {
                userImage
                userInfoStack
                Divider()
                userStats
                Divider()
                bioView
                repositoryList
            }
        }
    }
    
    @ViewBuilder
    var userImage: some View {
        if let avatarURL = URL(string: viewModel.userDetails?.avatarUrl ?? "") {
            KFImage(avatarURL)
                .resizable()
                .background(.white)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        }
    }
    
    var userInfoStack: some View {
        VStack(alignment: .center) {
            Text(viewModel.nameFieldValue)
                .font(.largeTitle)
                .bold()
            if viewModel.userDetails?.name != nil {
                Text(viewModel.username)
                    .font(.headline)
            }
        }
    }
    
    @ViewBuilder
    var bioView: some View {
        if let bio = viewModel.userDetails?.bio {
            VStack {
                Text(bio)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .defaultPadding()
                Divider()
            }
        }
    }
    
    var repositoryList: some View {
        ForEach(viewModel.repositories, id: \.id) { repository in
            repositoryCell(repository: repository)
        }
    }
    
    @ViewBuilder
    func repositoryCell(repository: Repository) -> some View {
        if let url = URL(string: repository.htmlUrl) {
            NavigationLink(
                destination: {
                    WebView(url)
                },
                label: {
                    RepositoryListingCell(repository: repository)
                }
            )
            Divider()
        }
    }
    
    var userStats: some View {
        VStack(spacing: 8) {
            HStack {
                StatsView(
                    systemIcon: "person.2",
                    label: "\(viewModel.copy.followersLabel)\(viewModel.userDetails?.followers ?? 0)"
                )
                Spacer()
                StatsView(
                    systemIcon: "person.and.arrow.left.and.arrow.right.outward",
                    label: "\(viewModel.copy.followingLabel)\(viewModel.userDetails?.following ?? 0)"
                )
            }
            if let location = viewModel.userDetails?.location {
                StatsView(systemIcon: "location", label: location)
            }
            
        }
        .defaultPadding()
    }
}
