//
//  MainViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 08.09.2021.
//

import UIKit

class MainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Main"
    }
}

extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        cell.textLabel?.text = String(Int.random(in: 0...100))
        return cell
    }
    
    
}
