//
//  PlayingCollectionViewCell.swift
//  Movie App
//
//  Created by Louai on 8/31/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class PlayingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var moviesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCells(_ photos: Results) {
        if let safePoster = photos.poster_path {
        let url = URL(string: "https://image.tmdb.org/t/p/w500"+"\(safePoster)")
        if let safeurl = url {
        let data = try? Data(contentsOf: safeurl)
        moviesImage.image = UIImage(data: data!)
        moviesImage.contentMode = .scaleAspectFill
        }
        
              }
    }

}
