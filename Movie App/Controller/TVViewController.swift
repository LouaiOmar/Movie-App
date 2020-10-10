//
//  TVViewController.swift
//  Movie App
//
//  Created by Louai on 9/9/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class TVViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UpdateMovies {
  
    @IBOutlet weak var collectionView: UICollectionView!
    var popular = PopularTV()
    var popularOfDetail = [TVData]()
    var movieIdStr = ""
    
  override var preferredStatusBarStyle : UIStatusBarStyle {
       return .lightContent
   }

    override func viewDidLoad() {
        super.viewDidLoad()
        popular.delegate = self
        popular.performRequest(with: "https://api.themoviedb.org/3/tv/popular?api_key=667ec8808ba78d63367e972efa8b510f")
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popular.photos.count
        }
    
       
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVCell", for: indexPath) as! TVViewCell
        cell.configureCells(popular.photos[indexPath.row])
        return cell
        }
    
 
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     movieIdStr = String(popular.photos[indexPath.row].id)
        popularOfDetail.insert(popular.photos[indexPath.row], at: 0)
     performSegue(withIdentifier: "goToDetails", sender: self)
 }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToDetails" {
               let destinationVC = segue.destination as! DetailsViewController
            destinationVC.popular.insert(popularOfDetail[0], at: 0)
               destinationVC.youtubeLink.performRequest(with: "https://api.themoviedb.org/3/tv/"+movieIdStr+"/videos?api_key=667ec8808ba78d63367e972efa8b510f")
           }
        
    }


    
    
    
    func updateUI() {
        collectionView.reloadData()
    }
    
    
}
