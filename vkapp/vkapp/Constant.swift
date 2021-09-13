//
//  Constant.swift
//  vkapp
//
//  Created by Pavel Lazarev on 08.09.2021.
//

import UIKit

enum Constant {
    
    enum Storyboard {
        static let login: UIStoryboard = .init(name: "Login", bundle: nil)
        static let mainTabBar: UIStoryboard = .init(name: "MainTabBar", bundle: nil)
        static let friends: UIStoryboard = .init(name: "Friends", bundle: nil)
        static let friendsPhotos: UIStoryboard = .init(name: "FriendsPhotos", bundle: nil)
        static let groups: UIStoryboard = .init(name: "Groups", bundle: nil)
        static let interestingGroups: UIStoryboard = .init(name: "InterestingGroups", bundle: nil)
    }
    
    enum Cell {
        case friend
        case group
        case photo
        
        var nib: UINib {
            switch self {
            case .friend:
                return .init(nibName: "FriendTableViewCell", bundle: nil)
            case .group:
                return .init(nibName: "GroupTableViewCell", bundle: nil)
            case .photo:
                return .init(nibName: "PhotoCollectionViewCell", bundle: nil)
            }
        }
        
        var identifier: String {
            switch self {
            case .friend:
                return "friendCell"
            case .group:
                return "groupCell"
            case .photo:
                return "photoCell"
            }
        }
    }
}
