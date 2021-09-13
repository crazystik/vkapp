//
//  FriendsPhotosViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 11.09.2021.
//

import UIKit

class FriendsPhotosViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    public var photo: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(Constant.Cell.photo.nib, forCellWithReuseIdentifier: Constant.Cell.photo.identifier)
    }
    
}

extension FriendsPhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Cell.photo.identifier, for: indexPath)
    }
}

extension FriendsPhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? PhotoCollectionViewCell)?.confiqure(with: photo)
    }
}

extension FriendsPhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
