//
//  UserModel.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

struct UserModel {
    let firstName: String
    let lastName: String
    let avatarImage: UIImage?
    
    var fullName: String {
        self.firstName + " " + self.lastName
    }
}
