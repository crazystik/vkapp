//
//  GroupsViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class GroupsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(GroupTableViewCell.self, forCellReuseIdentifier: GroupTableViewCell.identifier)
        return tableView
    }()
    
    private var groups: [Group] = []
    
    private let service = VKService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let groupsTitle = "Группы"
        self.navigationItem.title = groupsTitle
        
        self.setRightBarButtonItem()
        
        self.setTableView()
        
        self.getUserGroups()
    }
    
    private func setRightBarButtonItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGroups))
    }
    
    private func setTableView() {
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    @objc private func addGroups() {
        let groupsViewController = GroupsViewController()
        
        groupsViewController.modalPresentationStyle = .fullScreen
        show(groupsViewController, sender: self)
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
        
        self.service.groups { _ in
            
        }
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
        return tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.identifier, for: indexPath) as! GroupTableViewCell
    }
}

extension GroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? GroupTableViewCell)?.configure(with: groups[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.groups.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
