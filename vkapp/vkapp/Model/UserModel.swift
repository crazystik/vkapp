//
//  UserModel.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

struct User {
    let firstName: String
    let lastName: String
    let avatarImage: UIImage?
}

extension User {
    func name() -> String {
        return self.firstName + " " + self.lastName
    }
}
