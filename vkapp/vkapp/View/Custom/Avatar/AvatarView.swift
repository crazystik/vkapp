//
//  AvatarView.swift
//  vkapp
//
//  Created by Pavel Lazarev on 18.09.2021.
//

import UIKit

class AvatarView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var avatarImage: UIImage? {
        set {
            self.avatarImageView.image = newValue
        }
        get {
            return avatarImageView.image
        }
    }
    
    public var cornerRadius: CGFloat = 30 {
        didSet {
            self.setAvatarImageViewLayer()
            self.setBackgroundViewLayer()
        }
    }
    
    // MARK: - Shadow
    public var shadowColor: UIColor = .black {
        didSet {
            self.setBackgroundViewLayer()
        }
    }
    public var shadowOpacity: Float = 0.8 {
        didSet {
            self.setBackgroundViewLayer()
        }
    }
    public var shadowRadius: CGFloat = 5 {
        didSet {
            self.setBackgroundViewLayer()
        }
    }
    public var shadowOffset: CGSize = .zero {
        didSet {
            self.setBackgroundViewLayer()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        self.addSubview(self.backgroundView)
        self.setAvatarImageView()
        self.setBackgroundView()
    }
    
    private func setAvatarImageView() {
        self.addSubview(self.avatarImageView)
        self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.avatarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor).isActive = true
    }
    
    private func setBackgroundView() {
        self.backgroundView.topAnchor.constraint(equalTo: self.avatarImageView.topAnchor).isActive = true
        self.backgroundView.leftAnchor.constraint(equalTo: self.avatarImageView.leftAnchor).isActive = true
        self.backgroundView.rightAnchor.constraint(equalTo: self.avatarImageView.rightAnchor).isActive = true
        self.backgroundView.bottomAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setLayers()
    }
    
    private func setLayers() {
        self.setBackgroundViewLayer()
        self.setAvatarImageViewLayer()
    }
    
    private func setBackgroundViewLayer() {
        self.backgroundView.layer.cornerRadius = self.cornerRadius
        self.backgroundView.layer.shadowColor = self.shadowColor.cgColor
        self.backgroundView.layer.shadowOpacity = self.shadowOpacity
        self.backgroundView.layer.shadowRadius = self.shadowRadius
        self.backgroundView.layer.shadowOffset = self.shadowOffset
    }
    
    private func setAvatarImageViewLayer() {
        self.avatarImageView.layer.cornerRadius = self.cornerRadius
        self.avatarImageView.layer.shouldRasterize = true
        self.avatarImageView.layer.rasterizationScale = UIScreen.main.scale
        self.avatarImageView.clipsToBounds = true
    }
}
