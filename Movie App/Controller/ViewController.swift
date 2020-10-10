//
//  ViewController.swift
//  Movie App
//
//  Created by Louai on 8/23/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UpdateMovies {

    @IBOutlet weak var tableView: UITableView!
    
    var upcomingMovies = UpcomingMovies()
    var popularcelebrity = PopularCelebrity()
    var nowPlaying = UpcomingMovies()
    var topRated = UpcomingMovies()
    var trendingMovies = UpcomingMovies()
    var detailsresult = DetailsOfMovie()
    var youtubeLink = YoutubeLink()
    var movieIdStr = ""

    
    override func viewDidLayoutSubviews() {
        if let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height {
            tableView.contentInset = UIEdgeInsets(top: -statusBarHeight, left: 0, bottom: 0, right: 0)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLinks()
        tableView.register(UINib(nibName: "UpcomingTableViewCell", bundle: nil), forCellReuseIdentifier: "UpcomingTableCell")
        tableView.register(UINib(nibName: "CelebrityTableViewCell", bundle: nil), forCellReuseIdentifier: "CelebrityTableCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
           let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingTableCell", for: indexPath) as! UpcomingTableViewCell
            cell.configure(upcomingMovies.photos)
            cell.didSelectItemAction = { [weak self] indexPath in
                self?.movieIdStr = String(indexPath)
                self?.performSegue(withIdentifier: "goToDetails", sender: self)

                //                self?.detailsresult.performRequest(with: "https://api.themoviedb.org/3/movie/"+movieIdStr+"?api_key=667ec8808ba78d63367e972efa8b510f")
//                self?.youtubeLink.performRequest(with: "https://api.themoviedb.org/3/movie/"+movieIdStr+"/videos?api_key=667ec8808ba78d63367e972efa8b510f")
            }

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CelebrityTableCell", for: indexPath) as! CelebrityTableViewCell
            if indexPath.row == 1 {
                cell.configure(popularcelebrity.celebrityPhotos)
                cell.didSelectItemAction = { [weak self] indexPath in
                    self?.movieIdStr = String(indexPath)
                    self?.performSegue(withIdentifier: "goToCelebDetails", sender: self)
                }
                return cell
            } else if indexPath.row == 2 {
                cell.configure(nowPlaying.photos)
            } else if indexPath.row == 3 {
                cell.configureTop(topRated.photos)
            } else if indexPath.row == 4 {
                cell.configureTrending(trendingMovies.photos)
            }
            cell.didSelectItemAction = { [weak self] indexPath in
                self?.movieIdStr = String(indexPath)
                self?.performSegue(withIdentifier: "goToDetails", sender: self)
//                self?.detailsresult.performRequest(with: "https://api.themoviedb.org/3/movie/"+movieIdStr+"?api_key=667ec8808ba78d63367e972efa8b510f")
//                 self?.youtubeLink.performRequest(with: "https://api.themoviedb.org/3/movie/"+movieIdStr+"/videos?api_key=667ec8808ba78d63367e972efa8b510f")
            }
            return cell
        }
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 400
        } else {
            return 150
        }
    }
    
    
    func updateLinks() {
        upcomingMovies.delegate = self
        upcomingMovies.performRequest(with: LinkURLs.upcomingURL)
        popularcelebrity.delegate = self
        popularcelebrity.performRequest(with: LinkURLs.celebrityURL)
        nowPlaying.delegate = self
        nowPlaying.performRequest(with: LinkURLs.nowPlayingURL)
        topRated.delegate = self
        topRated.performRequest(with: LinkURLs.topRatedURL)
        trendingMovies.delegate = self
        trendingMovies.performRequest(with: LinkURLs.trendingURL)
    }

func updateUI() {
    tableView.reloadData()
}

}

// MARK: -
extension ViewController {
   
   
    
//    func updateUIForDetails() {
//        performSegue(withIdentifier: "goToDetails", sender: self)
//        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.detailsResult.performRequest(with: "https://api.themoviedb.org/3/movie/"+movieIdStr+"?api_key=667ec8808ba78d63367e972efa8b510f")
            destinationVC.youtubeLink.performRequest(with: "https://api.themoviedb.org/3/movie/"+movieIdStr+"/videos?api_key=667ec8808ba78d63367e972efa8b510f")
        } else {
            let destinationVC = segue.destination as! CelebDetailsViewController
            destinationVC.celebDetails.performRequest(with: "https://api.themoviedb.org/3/person/"+movieIdStr+"?api_key=667ec8808ba78d63367e972efa8b510f")
            destinationVC.celebAppearsIn.performRequest(with: "https://api.themoviedb.org/3/person/"+movieIdStr+"/movie_credits?api_key=667ec8808ba78d63367e972efa8b510f")
        }
            
            
            
            
            
            //            destinationVC.detailsResult = detailsresult.details
//            destinationVC.youtubeLink = youtubeLink
//            destinationVC.tableView.reloadData()
        
    }
    
    
    
    
    
    }
       
    
    


