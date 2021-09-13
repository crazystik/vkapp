//
//  InterestingGroupsViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class InterestingGroupsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(Constant.Cell.group.nib, forCellReuseIdentifier: Constant.Cell.group.identifier)
    }
    
}

extension InterestingGroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Constant.Cell.group.identifier, for: indexPath) as! GroupTableViewCell
    }
}

extension InterestingGroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? GroupTableViewCell)?.configure(with: groups[indexPath.row])
    }
}
