//
//  PhotoCollectionViewCell.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    public static let identifier = "photoCollectionViewCell"
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var likeControl: LikeControl = {
        let control = LikeControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    func confiqure(with photoURLString: String?) {
        guard let photoURLString = photoURLString,
              let photoURL = URL(string: photoURLString)
        else { return }
        DispatchQueue.global().async {
            URLSession.shared.dataTask(
                with: photoURL
            ) { data, response, error in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.setImageView(with: UIImage(data: data))
                    self.setLikeControl()
                }
            }.resume()
        }
        
    }
    
    private func setImageView(with image: UIImage?) {
        self.addSubview(self.userImageView)
        self.userImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.userImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.userImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.userImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.userImageView.image = image
    }
    
    private func setLikeControl() {
        self.addSubview(self.likeControl)
        self.likeControl.rightAnchor
            .constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.likeControl.bottomAnchor
            .constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        likeControl.layoutSubviews()
    }
}
