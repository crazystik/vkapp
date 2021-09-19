//
//  FriendTableViewCell.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: AvatarView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with user: User) {
        self.avatarImageView.avatarImage = user.avatarImage
        self.nameLabel.text = user.name
    }
}
