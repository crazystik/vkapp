//
//  Friends.swift
//  vkapp
//
//  Created by Pavel Lazarev on 13.10.2021.
//

import Foundation

class Friends {
    let firstLiteral: String
    var friends: [Friend]
    
    init(firstLiteral: String, friends: [Friend]) {
        self.firstLiteral = firstLiteral
        self.friends = friends
    }
}
