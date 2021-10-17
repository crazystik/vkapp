//
//  Session.swift
//  vkapp
//
//  Created by Pavel Lazarev on 17.10.2021.
//

import Foundation

final class Session {
    
    private init() {}
    
    static let shared = Session()
    
    var token: String = ""
    var userId: Int = 0
    
}
