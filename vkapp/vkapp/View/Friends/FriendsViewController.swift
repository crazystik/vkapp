//
//  FriendsViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
        return tableView
    }()
    
    private var friendsData: [Friends] = []
    
    private let service = FriendsAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let friendsTitle = "Друзья"
        self.navigationItem.title = friendsTitle
        
        self.setTableView()
        
        self.getFriends()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setTableView() {
        self.view.addSubview(tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func getFriends() {
        self.service.friends { [weak self] friends in
            friends.forEach { friend in
                if let value = self?.friendsData.first(where: { (friendsDataValue: Friends) in
                    return friendsDataValue.firstLiteral.uppercased() == String(friend.lastName.first ?? Character("")).uppercased()
                }) {
                    value.friends.append(friend)
                } else {
                    self?.friendsData.append(
                        (
                            Friends(
                                firstLiteral: String(friend.lastName.first ?? Character("")),
                                friends: [friend]
                            )
                        )
                    )
                }
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.setIndexControl()
            }
        }
    }
    
    private func setIndexControl() {
        let control = IndexControl()
        self.view.addSubview(control)
        control.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        control.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        control.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        control.setItems(from: self.friendsData.compactMap({$0.firstLiteral})) { item in
            print(item)
        }
        control.action { section in
            self.tableView.scrollToRow(
                at: IndexPath(row: 0, section: section),
                at: .top,
                animated: true
            )
        }
    }
}

extension FriendsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendsData.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return self.friendsData[section].friends.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FriendTableViewCell.identifier,
            for: indexPath
        ) as? FriendTableViewCell
        return cell!
    }
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        (cell as? FriendTableViewCell)?.configure(with: friendsData[indexPath.section].friends[indexPath.row])
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let friendPhotoViewController = FriendsPhotosViewController()
        friendPhotoViewController.modalPresentationStyle = .fullScreen
        friendPhotoViewController.ownerId = friendsData[indexPath.section].friends[indexPath.row].id
        show(friendPhotoViewController, sender: self)
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsData[section].firstLiteral
    }
}
