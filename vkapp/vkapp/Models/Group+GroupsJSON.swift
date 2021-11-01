//
//  Group+GroupsJSON.swift
//  vkapp
//
//  Created by Pavel Lazarev on 01.11.2021.
//

import Foundation

// MARK: - GroupJSON
struct GroupsJSON: Codable {
    let response: GroupsResponse
}

// MARK: - Response
struct GroupsResponse: Codable {
    let count: Int
    let items: [Group]
}

// MARK: - Item
struct Group: Codable {
    let id: Int
    let name: String
    let screenName: String
    let isClosed: Int
    let type: String
    let photo50, photo100, photo200: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}
