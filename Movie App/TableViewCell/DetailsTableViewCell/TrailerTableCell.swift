//
//  TrailerTableCell.swift
//  Movie App
//
//  Created by Louai on 9/4/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class TrailerTableCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    var didSelectVideo: ( () -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configureTableCell(_ videos: YouTubeVideos) {
    let url = URL(string: "https://img.youtube.com/vi/"+"\(videos.key)"+"/0.jpg")
    if let safeurl = url {
    let data = try? Data(contentsOf: safeurl)
        if let safeImage = data {
            videoImage.image = UIImage(data: safeImage)
            videoImage.contentMode = .scaleAspectFit
        }
    
            }
     }
    
  
}
