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
        return imageView
    }()
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    @IBInspectable
    var avatarImage: UIImage? {
        set {
            avatarImageView.image = newValue
            setupView()
        }
        get {
            return avatarImageView.image
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable
    var shadowColor: UIColor? {
        set {
            self.backgroundView.layer.shadowColor = newValue?.cgColor
        }
        get {
            return self.backgroundView.layer.shadowColor == nil
                ? UIColor(cgColor: self.backgroundView.layer.shadowColor!) : nil
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        set {
            self.backgroundView.layer.shadowOpacity = newValue
        }
        get {
            return self.backgroundView.layer.shadowOpacity
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        set {
            self.backgroundView.layer.shadowRadius = newValue
        }
        get {
            return self.backgroundView.layer.shadowRadius
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        set {
            self.backgroundView.layer.shadowOffset = newValue
        }
        get {
            return self.backgroundView.layer.shadowOffset
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        
        self.addSubview(self.backgroundView)
        self.backgroundView.frame = self.bounds
        
        self.backgroundView.layer.cornerRadius = self.bounds.height/2
//        self.backgroundView.layer.shadowColor = UIColor.black.cgColor
//        self.backgroundView.layer.shadowOpacity = 0.8
//        self.backgroundView.layer.shadowRadius = 5
//        self.backgroundView.layer.shadowOffset = .zero

        self.addSubview(self.avatarImageView)
        self.avatarImageView.frame = self.bounds
        self.avatarImageView.layer.cornerRadius = self.bounds.height/2
        self.avatarImageView.clipsToBounds = true
    }
}
