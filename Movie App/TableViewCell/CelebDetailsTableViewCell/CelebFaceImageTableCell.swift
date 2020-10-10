//
//  CelebFaceImageTableCell.swift
//  Movie App
//
//  Created by Louai on 9/7/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class CelebFaceImageTableCell: UITableViewCell {

    @IBOutlet weak var celebFaceImage: UIImageView!
    var didSelectClose: ( () -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureTableCell(_ details: CelebImageAndBioData) {
              let url = URL(string: "https://image.tmdb.org/t/p/w500"+"\(details.profile_path)")
              if let safeurl = url {
              let data = try? Data(contentsOf: safeurl)
              celebFaceImage.image = UIImage(data: data!)
              celebFaceImage.contentMode = .scaleAspectFit
              }
              
              }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        didSelectClose?()

    }
}
