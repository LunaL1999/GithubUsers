//
//  UserDetails.swift
//  GitHubUserListing
//
//  Created by Luna on 29/06/2025.
//

struct UserDetails: Sendable, Codable {
    let login: String
    let name: String?
    let avatarUrl: String
    let location: String?
    let bio: String?
    let followers: Int
    let following: Int
}
