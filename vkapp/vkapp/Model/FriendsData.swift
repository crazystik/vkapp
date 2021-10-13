//
//  FriendsData.swift
//  vkapp
//
//  Created by Pavel Lazarev on 13.10.2021.
//

import Foundation

class FriendsData {
    let firstLiteral: String
    var users: [User]
    
    init(firstLiteral: String, users: [User]) {
        self.firstLiteral = firstLiteral
        self.users = users
    }
}
