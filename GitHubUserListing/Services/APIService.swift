//
//  APIService.swift
//  GitHubUserListing
//
//  Created by Luna on 29/06/2025.
//

import Foundation

struct APIService {
    
    static let shared = APIService()
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    func getUserDetails(for username: String) async throws -> UserDetails {
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            throw APIError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.responseError
        }
        
        do {
            return try decoder.decode(UserDetails.self, from: data)
        } catch {
            throw APIError.dataError
        }
    }
    
    func getUserListing() async throws -> [User] {
        guard let url = URL(string: "https://api.github.com/users") else {
            throw APIError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.responseError
        }
        
        do {
            return try decoder.decode([User].self, from: data)
        } catch {
            print(error)
            throw APIError.dataError
        }
    }
    
    func getUserRepositories(for username: String) async throws -> [Repository] {
        guard let url = URL(string: "https://api.github.com/users/\(username)/repos") else {
            throw APIError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.responseError
        }
        
        do {
            return try decoder.decode([Repository].self, from: data)
        } catch {
            print(error)
            throw APIError.dataError
        }
    }
}
