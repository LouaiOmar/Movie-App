//
//  TableViewCell.swift
//  Movie App
//
//  Created by Louai on 8/23/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photos: [Results] = []
    var didSelectItemAction: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "UpcomingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UpcomingCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCollectionCell", for: indexPath) as! UpcomingCollectionViewCell
        cell.configureCells(photos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItemAction?(photos[indexPath.row].id)
    }
    
    
    
    
    
    
    
    func configure(_ photos: [Results]) {
        self.photos = photos
        collectionView.reloadData()
    }
    
   
}


