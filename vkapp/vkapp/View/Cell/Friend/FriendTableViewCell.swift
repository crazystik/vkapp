//
//  FriendTableViewCell.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with user: User) {
        self.avatarImageView.image = user.avatarImage
        self.nameLabel.text = user.name
    }
}
