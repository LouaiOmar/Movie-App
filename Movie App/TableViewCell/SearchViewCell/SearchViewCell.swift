//
//  SearchViewCell.swift
//  Movie App
//
//  Created by Louai on 9/11/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class SearchViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureTableCell(_ details: Results) {
              let url = URL(string: "https://image.tmdb.org/t/p/w500"+"\(details.poster_path!)")
              if let safeurl = url {
              let data = try? Data(contentsOf: safeurl)
              moviePoster.image = UIImage(data: data!)
              moviePoster.contentMode = .scaleAspectFit
              }
        movieName.text = details.title
        releaseDate.text = details.release_date
        }
    
}
