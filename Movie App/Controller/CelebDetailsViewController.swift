//
//  CelebDetailsViewController.swift
//  Movie App
//
//  Created by Louai on 9/5/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class CelebDetailsViewController: UITableViewController, UpdateMovies {

    
    var celebDetails = CelebImageAndBio()
    var celebAppearsIn = CelebAppearsInJSON()

    override func viewDidLoad() {
        super.viewDidLoad()
        celebAppearsIn.delegate = self
        celebDetails.delegate = self
       tableView.register(UINib(nibName: "CelebFaceImageTableCell", bundle: nil), forCellReuseIdentifier: "CelebFaceImage")
        tableView.register(UINib(nibName: "CelebrityTableViewCell", bundle: nil), forCellReuseIdentifier: "CelebrityTableCell")
        tableView.register(UINib(nibName: "CelebBioCell", bundle: nil), forCellReuseIdentifier: "CelebBioCell")
    }

   // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CelebFaceImage", for: indexPath) as! CelebFaceImageTableCell
            if let safedetails = celebDetails.celebdetails {
                cell.configureTableCell(safedetails)
                           cell.didSelectClose = {
                self.dismiss(animated: true, completion: nil)
                                                 }
            }
                   return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CelebrityTableCell", for: indexPath) as! CelebrityTableViewCell
            cell.configureAppearsIn(celebAppearsIn.posters)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CelebBioCell", for: indexPath) as! CelebBioCell
            if let safedetails = celebDetails.celebdetails {
                        cell.configureTableCell(safedetails)
            }
                    return cell
                    
        }
    
}

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        } else if indexPath.row == 1 {
            return 150
        } else {
            return 250
        }
    }
    
   
    func updateUI() {
        tableView.reloadData()
    }
    
    
   

}

