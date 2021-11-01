//
//  Photos+PhotosJSON.swift
//  vkapp
//
//  Created by Pavel Lazarev on 01.11.2021.
//

import Foundation

// MARK: - PhotosJSON
struct PhotosJSON: Codable {
    let response: PhotosResponse
}

// MARK: - Response
struct PhotosResponse: Codable {
    let count: Int
    let items: [Photos]
}

// MARK: - Item
struct Photos: Codable {
    let albumId, date, id, ownerId, postId: Int
    let hasTags: Bool
    let sizes: [PhotoSize]
    let text: String
    let likes: Likes
    let tags, reposts, comments: Comments
    let canComment: Int
    let lat, long: Double?

    enum CodingKeys: String, CodingKey {
        case albumId = "album_id"
        case ownerId = "owner_id"
        case hasTags = "has_tags"
        case postId = "post_id"
        case canComment = "can_comment"
        case date, id, sizes, text, likes,
             reposts, comments, tags, lat, long
    }
}

// MARK: - Comments
struct Comments: Codable {
    let count: Int
}

// MARK: - Likes
struct Likes: Codable {
    let userLikes: Int
    let count: Int

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

// MARK: - Photo + Size
struct PhotoSize: Codable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}
