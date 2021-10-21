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
    
    private let service = VKService()
    
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
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func getFriends() {
        let dataSource: [User] = [
            .init(firstName: "Elizaveta", lastName: "Lazareva", avatarImage: .init(named: "foxes")!),
            .init(firstName: "Iov", lastName: "Zaytsev", avatarImage: .init(named: "cat0")!),
            .init(firstName: "Afonasei", lastName: "Kovalev", avatarImage: .init(named: "cat1")!),
            .init(firstName: "Nikolai", lastName: "Vlasov", avatarImage: .init(named: "cat2")!),
            .init(firstName: "Vanya", lastName: "Romanov", avatarImage: .init(named: "cat3")!),
            .init(firstName: "Pavel", lastName: "Orlov", avatarImage: .init(named: "cat4")!),
            .init(firstName: "Faddei", lastName: "Stepanov", avatarImage: .init(named: "cat5")!),
            .init(firstName: "Yaroslav", lastName: "Egorov", avatarImage: .init(named: "cat6")!),
            .init(firstName: "Serafim", lastName: "Vinogradov", avatarImage: .init(named: "cat7")!),
            .init(firstName: "Zakhar", lastName: "Zhukov", avatarImage: .init(named: "cat8")!),
            .init(firstName: "Karpacho", lastName: "Dmitriev", avatarImage: .init(named: "cat9")!),
            .init(firstName: "Kazimir", lastName: "Smirnov", avatarImage: .init(named: "cat10")!),
            .init(firstName: "Slava", lastName: "Kovalev", avatarImage: .init(named: "cat11")!),
        ]
        
        dataSource.forEach { user in
            if let value = self.friendsData.first(where: { (friendsDataValue: Friends) in
                return friendsDataValue.firstLiteral.uppercased() == String(user.lastName.first ?? Character("")).uppercased()
            }) {
                value.users.append(user)
            } else {
                self.friendsData.append(
                    (
                        Friends(firstLiteral: String(user.lastName.first ?? Character("")),
                                    users: [user])
                    )
                )
            }
        }
        self.friendsData.sort(by: {$0.firstLiteral < $1.firstLiteral})
        self.tableView.reloadData()
        self.setIndexControl()
        self.service.friends { _ in
            
        }
    }
    
    private func setIndexControl() {
        let control = IndexControl()
        self.view.addSubview(control)
        control.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        control.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
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
        return self.friendsData[section].users.count
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
        (cell as? FriendTableViewCell)?.configure(with: friendsData[indexPath.section].users[indexPath.row])
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let friendPhotoViewController = FriendsPhotosViewController()
        friendPhotoViewController.modalPresentationStyle = .fullScreen
        friendPhotoViewController.photo = friendsData[indexPath.section].users[indexPath.row].avatarImage
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
