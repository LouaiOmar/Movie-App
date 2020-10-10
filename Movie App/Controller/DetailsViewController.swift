//
//  DetailsViewController.swift
//  Movie App
//
//  Created by Louai on 9/3/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit
import SafariServices

class DetailsViewController: UITableViewController, UpdateMovies {

    var detailsResult =  DetailsOfMovie()
    var popular = [TVData]()
    var youtubeLink = YoutubeLink()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeLink.delegate = self
        detailsResult.delegate = self
       tableView.register(UINib(nibName: "MoviePosterTableCell", bundle: nil), forCellReuseIdentifier: "MoviePoster")
        tableView.register(UINib(nibName: "OverviewTableCell", bundle: nil), forCellReuseIdentifier: "OverViewCell")
        tableView.register(UINib(nibName: "TrailerTableCell", bundle: nil), forCellReuseIdentifier: "TrailerCell")
    }

   // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoviePoster", for: indexPath) as! MoviePosterTableCell
            if let safeDetails = detailsResult.details {
                cell.configureTableCell(safeDetails)
            }
            if popular.count == 1 {
                cell.configureTableCell(popular[0])
            }
             cell.didSelectClose = {
                self.popular.removeAll()
                self.dismiss(animated: true, completion: nil)
                }
            return cell
        } else if indexPath.row == 1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "OverViewCell", for: indexPath) as! OverviewTableCell
            if let safedetails = detailsResult.details {
                        cell.configureTableCell(safedetails)
            }
            if popular.count == 1 {
                         cell.configureTableCell(popular[0])
                     }
                    return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrailerCell", for: indexPath) as! TrailerTableCell
            if let safeVideo = youtubeLink.videos {
                        cell.configureTableCell(safeVideo)
                      
            }
                    return cell
        }
    
}

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 350
        } else if indexPath.row == 1 {
            return 80
        } else {
            return 250
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            if let safeKey = youtubeLink.videos?.key {
                showTutorial(safeKey)
            }
        }
        
    }
    
    
    func updateUI() {
        tableView.reloadData()
    }
    
    
   

    func showTutorial(_ key: String) {
        if let url = URL(string: "https://www.youtube.com/watch?v=\(key)") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }


}
