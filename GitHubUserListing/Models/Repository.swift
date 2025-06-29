//
//  Repository.swift
//  GitHubUserListing
//
//  Created by Luna on 29/06/2025.
//

struct Repository: Sendable, Codable {
    let id: Int
    let name: String
    let htmlUrl: String
    let language: String?
    let stargazersCount: Int
    let fork: Bool
}
