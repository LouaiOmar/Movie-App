//
//  SearchViewController.swift
//  Movie App
//
//  Created by Louai on 9/11/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, UpdateMovies {
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchedMovie = UpcomingMovies()
    var movieIdStr = ""
    
    override func viewDidLoad() {
          super.viewDidLoad()
        tableView.rowHeight = 120
        searchedMovie.delegate = self
        tableView.register(UINib(nibName: "SearchViewCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        
      }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedMovie.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchViewCell
        cell.configureTableCell(searchedMovie.photos[indexPath.row])
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text!.replacingOccurrences(of: " ", with: "%20")
        searchedMovie.performRequest(with: "https://api.themoviedb.org/3/search/movie?api_key=667ec8808ba78d63367e972efa8b510f&query=\(searchText)")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieIdStr = String(searchedMovie.photos[indexPath.row].id)
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
        DispatchQueue.main.async {
         searchBar.resignFirstResponder()
             }
     }

 }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        DispatchQueue.main.async {
         searchBar.resignFirstResponder()
             }
    }
    
    
    
    
    func updateUI() {
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToDetails" {
               let destinationVC = segue.destination as! DetailsViewController
               destinationVC.detailsResult.performRequest(with: "https://api.themoviedb.org/3/movie/"+movieIdStr+"?api_key=667ec8808ba78d63367e972efa8b510f")
               destinationVC.youtubeLink.performRequest(with: "https://api.themoviedb.org/3/movie/"+movieIdStr+"/videos?api_key=667ec8808ba78d63367e972efa8b510f")
        }
    }
    
}
