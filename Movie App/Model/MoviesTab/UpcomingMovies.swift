//
//  UpcomingMovies.swift
//  Movie App
//
//  Created by Louai on 8/27/20.
//  Copyright © 2020 Louai. All rights reserved.
//


import Foundation

class UpcomingMovies: SuperClass{
    
    
    var delegate: UpdateMovies?
    var photos: [Results] = []
    

    override func performRequest(with upcomingURL: String) {
            super.performRequest(with: upcomingURL)
    }

    override func parseJSON(_ upcomingData: Data) {
        super.parseJSON(upcomingData)
    }
 
    override func dispatchQueue(_ decodeData: UpcomingData) {
        self.photos = decodeData.results
        self.photos = self.photos.filter{ $0.poster_path != nil}
        self.delegate?.updateUI()
    }
    


}
