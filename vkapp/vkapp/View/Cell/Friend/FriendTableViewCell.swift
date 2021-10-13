//
//  FriendTableViewCell.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    public static let identifier = "friendTableViewCell"
    
    private lazy var avatarImageView: AvatarView = {
        let view = AvatarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 10
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.layoutSubviews()
    }
    
    func configure(with user: User) {
        self.setAvatarImageView(with: user.avatarImage)
        self.setNameLabel(wiht: user.name())
    }
    
    private func setAvatarImageView(with avatar: UIImage?) {
        self.addSubview(self.avatarImageView)
        self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.avatarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor).isActive = true
        self.avatarImageView.avatarImage = avatar
    }
    
    private func setNameLabel(wiht name: String) {
        self.addSubview(self.nameLabel)
        self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.nameLabel.leftAnchor.constraint(equalTo: self.avatarImageView.rightAnchor, constant: 8).isActive = true
        self.nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.nameLabel.text = name
    }
    
}
