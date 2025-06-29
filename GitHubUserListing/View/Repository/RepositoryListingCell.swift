//
//  RepositoryListingCell.swift
//  GitHubUserListing
//
//  Created by Luna on 28/06/2025.
//

import SwiftUI

struct RepositoryListingCell: View {
    
    let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    var body: some View {
        HStack(alignment: .center) {
            mainStack
            Spacer()
            Image(systemName: "chevron.right")
        }
        .defaultPadding()
    }
    
    var mainStack: some View {
        VStack(alignment: .leading) {
            Text(repository.name)
                .font(.title3)
                .bold()
            infoStack
        }
    }
    
    var infoStack: some View {
        HStack(alignment: .center, spacing: 16) {
            StatsView(systemIcon: "star", label: String(repository.stargazersCount))
            if let language = repository.language {
                StatsView(systemIcon: "slider.horizontal.3", label: language)
            }
        }
    }
}
