//
//  UpcomingData.swift
//  Movie App
//
//  Created by Louai on 8/27/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import Foundation

struct UpcomingData: Codable {
    
    var results: [Results]
}

struct Results: Codable {
    var poster_path: String?
    var title: String
    var release_date: String?
    var id: Int
}

protocol UpdateMovies {
    func updateUI()
}


struct CelebrityData: Codable {
    var results: [Celebrity]
}

struct Celebrity: Codable {
    var profile_path: String?
    var id: Int
}
