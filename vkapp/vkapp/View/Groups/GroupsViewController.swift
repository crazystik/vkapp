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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGroups))
        
        getUserGroups()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    @objc private func addGroups() {
        guard let interestingGroupsViewController = Constant.Storyboard.interestingGroups.instantiateInitialViewController() else {
            fatalError()
        }
        
        interestingGroupsViewController.modalPresentationStyle = .fullScreen
        show(interestingGroupsViewController, sender: self)
    }
    
    private func getUserGroups() {
        self.groups = [
            .init(name: "Обычная группа по интересам", avatarImage: UIImage(named: "cat1")),
            .init(name: "Обычная музыкальная группа", avatarImage: UIImage(named: "cat2")),
            .init(name: "Что-то ещё обычное", avatarImage: UIImage(named: "cat3")),
            .init(name: "Возможно, что-то интересное", avatarImage: UIImage(named: "cat4")),
            .init(name: "КБ", avatarImage: UIImage(named: "cat5")),
            .init(name: "Необычная группа по интересам", avatarImage: UIImage(named: "cat6")),
            .init(name: "Необычная музыкальная группа", avatarImage: UIImage(named: "cat7")),
            .init(name: "Навальный", avatarImage: UIImage(named: "cat8")),
            .init(name: "¯\\_(ツ)_/¯", avatarImage: UIImage(named: "cat9")),
        ]
        self.tableView.reloadData()
    }
    
    public func set(group: Group) {
        self.groups.append(group)
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.groups.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
