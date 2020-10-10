//
//  CelebrityCollectionViewCell.swift
//  Movie App
//
//  Created by Louai on 8/28/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class CelebrityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var celebrityImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
            celebrityImage.layer.cornerRadius = self.frame.size.height / 3
        
        
    }

    func configureCells(_ photos: Celebrity) {
        if let safePhoto = photos.profile_path {
        let url = URL(string: "https://image.tmdb.org/t/p/w500"+"\(safePhoto)")
        if let safeurl = url {
        let data = try? Data(contentsOf: safeurl)
        celebrityImage.image = UIImage(data: data!)
        celebrityImage.contentMode = .scaleAspectFill
        }
        
                }
        
        }
        
    
    }

    

