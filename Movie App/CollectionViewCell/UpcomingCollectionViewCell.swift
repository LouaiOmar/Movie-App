//
//  MyCollectionViewCell.swift
//  Movie App
//
//  Created by Louai on 8/23/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releasedateLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCells(_ photos: Results) {
        titleLabel.text = photos.title
        if let safePoster = photos.poster_path {
            let url = URL(string: "https://image.tmdb.org/t/p/w500"+"\(safePoster)")
            if let safeurl = url {
            let data = try? Data(contentsOf: safeurl)
            image.image = UIImage(data: data!)
            image.contentMode = .scaleAspectFill
            }
        }
        
            releasedateLabel.text = photos.release_date
        
    }
        
       

}


