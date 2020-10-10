//
//  OverviewTableCell.swift
//  Movie App
//
//  Created by Louai on 9/4/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class OverviewTableCell: UITableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

        func configureTableCell(_ details: DetailsResult) {
            overviewLabel.text = details.overview
               }
    
    func configureTableCell(_ details: TVData) {
               overviewLabel.text = details.overview
                  }
}
