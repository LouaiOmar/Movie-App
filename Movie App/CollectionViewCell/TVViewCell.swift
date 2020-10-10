//
//  TVViewCell.swift
//  Movie App
//
//  Created by Louai on 9/10/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class TVViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCells(_ photos: TVData) {
    if let safePoster = photos.poster_path {
    let url = URL(string: "https://image.tmdb.org/t/p/w500"+"\(safePoster)")
    if let safeurl = url {
    let data = try? Data(contentsOf: safeurl)
    posterImage.image = UIImage(data: data!)
    posterImage.contentMode = .scaleAspectFill
            }
    
            }


    }

}
