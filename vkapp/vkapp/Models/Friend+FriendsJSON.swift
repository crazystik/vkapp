//
//  Friend.swift
//  vkapp
//
//  Created by Pavel Lazarev on 31.10.2021.
//

import Foundation

// MARK: - FriendsJSON
struct FriendsJSON: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Friend
struct Friend: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String

    var fullName: String {
        firstName + " " + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
    }
}
