//
//  GenericErrorView.swift
//  GitHubUserListing
//
//  Created by Luna on 29/06/2025.
//

import SwiftUI

struct GenericErrorView: View {
    var body: some View {
        VStack(spacing: 16) {
            errorImage
            errorMessage
        }
    }
    
    var errorImage: some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .foregroundColor(.red)
            .font(.system(size: 48, weight: .bold))
    }
    
    var errorMessage: some View {
        Text("Something went wrong")
            .font(.title)
            .bold()
        
    }
}

#Preview {
    GenericErrorView()
}
