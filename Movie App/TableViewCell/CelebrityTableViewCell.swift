//
//  CelebrityTableViewCell.swift
//  Movie App
//
//  Created by Louai on 8/28/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class CelebrityTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    @IBOutlet weak var playingCollectionView: UICollectionView!
    @IBOutlet weak var celebrityCollectionView: UICollectionView!
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var celebAppearsCollectinView: UICollectionView!
    
    var celebrityPhotos: [Celebrity] = []
    var nowPlayingPhotos: [Results] = []
    var topRated: [Results] = []
    var trendingMovies = [Results]()
    var celebAppears = [Results]()
    var didSelectItemAction: ((Int) -> Void)?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        celebrityCollectionView.register(UINib(nibName: "CelebrityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CelebrityCollectionCell")
         playingCollectionView.register(UINib(nibName: "PlayingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlayingCollectionCell")
        celebrityCollectionView.delegate = self
        celebrityCollectionView.dataSource = self
        playingCollectionView.delegate = self
        playingCollectionView.dataSource = self
        topRatedCollectionView.register(UINib(nibName: "PlayingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlayingCollectionCell")
        topRatedCollectionView.delegate = self
        topRatedCollectionView.dataSource = self
        trendingCollectionView.register(UINib(nibName: "PlayingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlayingCollectionCell")
        trendingCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        celebAppearsCollectinView.delegate = self
        celebAppearsCollectinView.dataSource = self
        celebAppearsCollectinView.register(UINib(nibName: "PlayingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlayingCollectionCell")
            }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case celebrityCollectionView:
            return celebrityPhotos.count
        case playingCollectionView:
            return nowPlayingPhotos.count
        case topRatedCollectionView:
            return topRated.count
        case trendingCollectionView:
            return trendingMovies.count
        case celebAppearsCollectinView:
            return celebAppears.count
        default:
            return 20
        }
    }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if  collectionView == celebrityCollectionView {
            playingCollectionView.isHidden = true
            topRatedCollectionView.isHidden = true
            trendingCollectionView.isHidden = true
            celebAppearsCollectinView.isHidden = true
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CelebrityCollectionCell", for: indexPath) as! CelebrityCollectionViewCell
                categoryLabel.text = "Popular Celebrities"
            cell.configureCells(celebrityPhotos[indexPath.row])
                return cell
        } else if collectionView == playingCollectionView {
           topRatedCollectionView.isHidden = true
           trendingCollectionView.isHidden = true
            celebAppearsCollectinView.isHidden = true
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayingCollectionCell", for: indexPath) as! PlayingCollectionViewCell
                categoryLabel.text = "Now Playing"
            cell.configureCells(nowPlayingPhotos[indexPath.row])
                return cell
        } else if collectionView == topRatedCollectionView {
            trendingCollectionView.isHidden = true
            celebAppearsCollectinView.isHidden = true
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayingCollectionCell", for: indexPath) as! PlayingCollectionViewCell
                categoryLabel.text = "Top Rated"
            cell.configureCells(topRated[indexPath.row])
                return cell
        } else if collectionView == trendingCollectionView {
            celebAppearsCollectinView.isHidden = true
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayingCollectionCell", for: indexPath) as! PlayingCollectionViewCell
                categoryLabel.text = "Trending"
            cell.configureCells(trendingMovies[indexPath.row])
                return cell
        } else if collectionView == celebAppearsCollectinView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayingCollectionCell", for: indexPath) as! PlayingCollectionViewCell
            categoryLabel.text = "Appears In"
        cell.configureCells(celebAppears[indexPath.row])
            return cell
        } else {
            preconditionFailure("unknown")
        }
       }
       
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 120, height: 120)
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          switch collectionView{
          case celebrityCollectionView:
            didSelectItemAction?(celebrityPhotos[indexPath.row].id)
          case playingCollectionView:
              didSelectItemAction?(nowPlayingPhotos[indexPath.row].id)
          case topRatedCollectionView:
            didSelectItemAction?(topRated[indexPath.row].id)
          case trendingCollectionView:
            didSelectItemAction?(trendingMovies[indexPath.row].id)
          default:
              return
       }
    }
    
    func configureTrending(_ photos: [Results]) {
        self.trendingMovies = photos
        trendingCollectionView.reloadData()
    }
    
    
    func configureTop(_ photos: [Results]) {
        self.topRated = photos
        topRatedCollectionView.reloadData()
    }
    
    
     func configure(_ photos: [Celebrity]) {
           self.celebrityPhotos = photos
           celebrityCollectionView.reloadData()
       }
  
    func configure(_ photos: [Results]) {
              self.nowPlayingPhotos = photos
              playingCollectionView.reloadData()
          }
   
    func configureAppearsIn(_ photos: [Results]) {
        self.celebAppears = photos
        celebAppearsCollectinView.reloadData()
    }
    
    

}
