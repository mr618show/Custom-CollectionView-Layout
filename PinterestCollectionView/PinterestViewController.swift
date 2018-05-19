//
//  ViewController.swift
//  PinterestCollectionView
//
//  Created by Rui Mao on 5/19/18.
//  Copyright © 2018 Rui Mao. All rights reserved.
//

import UIKit

class PinterestViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let images = ["1", "2", "3", "4", "5", "6" , "7", "8", "9"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        //layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        //layout.minimumLineSpacing = 5
        
        //layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20) / 2, height: (self.collectionView.frame.size.height) / 3)
        
    }


}

extension PinterestViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
}

extension PinterestViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PinterestCollectionViewCell {
            cell.imageView.image = UIImage(named: images[indexPath.item])
            cell.clipsToBounds = true
            cell.layer.cornerRadius = 15
            cell.imageView.contentMode = .scaleAspectFill
            return cell
        }
        return UICollectionViewCell()
        
    }
}

extension PinterestViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = UIImage(named: images[indexPath.item])
        if let height = image?.size.height {
            return height / 9
        }
        return 0.0
    }
    
}

