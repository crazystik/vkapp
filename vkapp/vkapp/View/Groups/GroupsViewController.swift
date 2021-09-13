//
//  GroupsViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class GroupsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let groupsTitle = "Группы"
        self.navigationItem.title = groupsTitle
        
        self.tableView.register(Constant.Cell.group.nib, forCellReuseIdentifier: Constant.Cell.group.identifier)
        getUserGroups()
    }
    
    private func getUserGroups() {
        self.groups = [
            .init(name: "Обычная группа по интересам", avatarImage: nil),
            .init(name: "Обычная музыкальная группа", avatarImage: nil),
            .init(name: "Что-то ещё обычное", avatarImage: nil),
            .init(name: "Возможно, что-то интересное", avatarImage: nil),
            .init(name: "КБ", avatarImage: nil),
            .init(name: "Необычная группа по интересам", avatarImage: nil),
            .init(name: "Необычная музыкальная группа", avatarImage: nil),
            .init(name: "Навальный", avatarImage: nil),
            .init(name: "¯\\_(ツ)_/¯", avatarImage: nil),
        ]
        self.tableView.reloadData()
    }
}

extension GroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Constant.Cell.group.identifier, for: indexPath) as! GroupTableViewCell
    }
}

extension GroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? GroupTableViewCell)?.configure(with: groups[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
