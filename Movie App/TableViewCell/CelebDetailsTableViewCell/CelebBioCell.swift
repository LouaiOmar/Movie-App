//
//  CelebBioCell.swift
//  Movie App
//
//  Created by Louai on 9/7/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class CelebBioCell: UITableViewCell {

    @IBOutlet weak var biographyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    
    func configureTableCell(_ details: CelebImageAndBioData) {
                
    biographyLabel.text = details.biography
                
                }
    
}
