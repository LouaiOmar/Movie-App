//
//  MoviePosterTableCell.swift
//  Movie App
//
//  Created by Louai on 9/3/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class MoviePosterTableCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var circularProgress: CircularProgressView!
    @IBOutlet weak var ratingLabel: UILabel!
    var value: Float = 0.0 {
        didSet {
            circularProgress.setProgressWithAnimation(duration: 1.0, value: value / 10)
        }
    }
    var didSelectClose: ( () -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

   func configureTableCell(_ details: DetailsResult) {
    value = details.vote_average
        ratingLabel.text = String(value)
        movieName.text = details.title
           let url = URL(string: "https://image.tmdb.org/t/p/w500"+"\(details.poster_path)")
           if let safeurl = url {
           let data = try? Data(contentsOf: safeurl)
           posterImage.image = UIImage(data: data!)
           posterImage.contentMode = .scaleAspectFit
           }
           releaseDate.text = "Release Date: \(details.release_date)"
            runtimeLabel.text = "Runtime: \(String(details.runtime))"
           }
           
          
        func configureTableCell(_ details: TVData) {
           value = details.vote_average
               ratingLabel.text = String(value)
               movieName.text = details.name
                  let url = URL(string: "https://image.tmdb.org/t/p/w500"+"\(details.poster_path!)")
                  if let safeurl = url {
                  let data = try? Data(contentsOf: safeurl)
                  posterImage.image = UIImage(data: data!)
                  posterImage.contentMode = .scaleAspectFit
                  }
                  
                }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        didSelectClose?()
    }
}
