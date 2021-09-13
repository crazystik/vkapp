//
//  FriendsViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var friendsData: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let friendsTitle = "Друзья"
        
        self.navigationItem.title = friendsTitle
        
        let friendCell = Constant.Cell.friend
        self.tableView.register(friendCell.nib, forCellReuseIdentifier: friendCell.identifier)
        self.getFriends()
    }
    
    private func getFriends() {
        self.friendsData = [
            .init(name: "Iov Zaytsev", avatarImage: .init(named: "cat0")!),
            .init(name: "Afonasei Kovalev", avatarImage: .init(named: "cat1")!),
            .init(name: "Nikolai Vlasov", avatarImage: .init(named: "cat2")!),
            .init(name: "Vanya Romanov", avatarImage: .init(named: "cat3")!),
            .init(name: "Pavel Orlov", avatarImage: .init(named: "cat4")!),
            .init(name: "Faddei Stepanov", avatarImage: .init(named: "cat5")!),
            .init(name: "Yaroslav Egorov", avatarImage: .init(named: "cat6")!),
            .init(name: "Serafim Vinogradov", avatarImage: .init(named: "cat7")!),
            .init(name: "Zakhar Zhukov", avatarImage: .init(named: "cat8")!),
            .init(name: "Karp Dmitriev", avatarImage: .init(named: "cat9")!),
            .init(name: "Kazimir Smirnov", avatarImage: .init(named: "cat10")!),
            .init(name: "Slava Kovalev", avatarImage: .init(named: "cat11")!),
        ]
        self.tableView.reloadData()
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Cell.friend.identifier, for: indexPath) as? FriendTableViewCell
        return cell!
    }
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? FriendTableViewCell)?.configure(with: friendsData[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
