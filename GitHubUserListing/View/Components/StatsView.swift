//
//  StatsView.swift
//  GitHubUserListing
//
//  Created by Luna on 28/06/2025.
//

import SwiftUI

struct StatsView: View {
    let icon: String
    let label: String
    
    init(systemIcon: String, label: String) {
        self.icon = systemIcon
        self.label = label
    }
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(label)
                .font(.body)
        }
    }
}
