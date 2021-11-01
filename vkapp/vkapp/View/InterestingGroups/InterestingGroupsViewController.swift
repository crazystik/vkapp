//
//  InterestingGroupsViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class InterestingGroupsViewController: UIViewController {
    
    private lazy var groupsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(GroupTableViewCell.self, forCellReuseIdentifier: GroupTableViewCell.identifier)
        return tableView
    }()
    
    private let service = GroupsAPI()
    
    private var groups: [Group] = [] {
        didSet {
            self.groupsTableView.reloadData()
        }
    }
    
    private var searchText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Интересное"
        self.setTableView()
        self.getGroups()
    }
    
    private func setTableView() {
        self.view.addSubview(self.groupsTableView)
        self.groupsTableView.delegate = self
        self.groupsTableView.dataSource = self
        self.groupsTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.groupsTableView.leftAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.groupsTableView.rightAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.groupsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func getGroups() {
        self.service.searchGroups(
            searchText: self.searchText
        ) { groups in
            self.groups = groups
        }
    }
}

extension InterestingGroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.identifier, for: indexPath) as! GroupTableViewCell
    }
}
    
extension InterestingGroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? GroupTableViewCell)?.configure(with: groups[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (self.navigationController?.viewControllers.first(where: {($0 is GroupsViewController)}) as? GroupsViewController)?.set(group: self.groups[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
