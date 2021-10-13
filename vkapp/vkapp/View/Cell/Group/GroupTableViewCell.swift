//
//  GroupTableViewCell.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    public static let identifier = "groupTableViewCell"
    
    private lazy var groupImageView: AvatarView = {
        let view = AvatarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var groupNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 10
        return label
    }()
    
    func configure(with group: Group) {
        self.setGroupImageView(with: group.avatarImage)
        self.setGroupNameLabel(wiht: group.name)
    }
    
    private func setGroupImageView(with avatar: UIImage?) {
        self.addSubview(self.groupImageView)
        self.groupImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.groupImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.groupImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.groupImageView.heightAnchor.constraint(equalTo: self.groupImageView.widthAnchor).isActive = true
        self.groupImageView.avatarImage = avatar
    }
    
    private func setGroupNameLabel(wiht name: String) {
        self.addSubview(self.groupNameLabel)
        self.groupNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.groupNameLabel.leftAnchor.constraint(equalTo: self.groupImageView.rightAnchor, constant: 8).isActive = true
        self.groupNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.groupNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.groupNameLabel.text = name
    }
    
}
