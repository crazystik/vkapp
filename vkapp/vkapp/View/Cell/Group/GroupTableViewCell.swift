//
//  GroupTableViewCell.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet private weak var groupImageView: AvatarView!
    @IBOutlet private weak var groupNameLabel: UILabel!
    
    func configure(with group: Group) {
        self.groupImageView.avatarImage = group.avatarImage
        self.groupNameLabel.text = group.name
    }
    
}
