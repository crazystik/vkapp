//
//  MainTabBarController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendsItem = UINavigationController(rootViewController: FriendsViewController())
        friendsItem.modalPresentationStyle = .fullScreen
        friendsItem.navigationBar.backgroundColor = .white
        friendsItem.tabBarItem = UITabBarItem(title: "Друзья", image: .init(systemName: "person.2"), selectedImage: .init(systemName: "person.2.fill"))
        let groupsItem = UINavigationController(rootViewController: GroupsViewController())
        groupsItem.modalPresentationStyle = .fullScreen
        groupsItem.navigationBar.backgroundColor = .white
        groupsItem.tabBarItem = UITabBarItem(title: "Группы", image: .init(systemName: "person.3"), selectedImage: .init(systemName: "person.3.fill"))
        tabBar.backgroundColor = .white
        viewControllers = [friendsItem, groupsItem]
    }
}
