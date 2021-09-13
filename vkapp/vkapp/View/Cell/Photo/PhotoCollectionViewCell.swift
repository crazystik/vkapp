//
//  PhotoCollectionViewCell.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var userImageView: UIImageView!
    
    func confiqure(with photo: UIImage?) {
        self.userImageView.image = photo
    }

}
