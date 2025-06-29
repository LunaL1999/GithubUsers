//
//  View+Helper.swift
//  GitHubUserListing
//
//  Created by Luna on 28/06/2025.
//

import SwiftUI

struct DefaultPaddingStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
    }
}

extension View {
    func defaultPadding() -> some View {
        modifier(DefaultPaddingStyle())
    }
}
