//
//  PerformSegueModally.swift
//  Movie App
//
//  Created by Louai on 9/3/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import Foundation



struct DetailsResult: Codable {
    var poster_path: String
    var title: String
    var release_date: String
    var vote_average: Float
    var runtime: Int
    var overview: String
}

protocol UpdateUIDetails {
    func updateUIForDetails()
}

struct YouTubeVideos: Codable {
    var key: String
}

struct VideoResults: Codable {
    var results: [YouTubeVideos]
}


struct CelebImageAndBioData: Codable {
    var biography: String
    var profile_path: String
}

struct celebAppearsIn: Codable {
    var cast: [Results]
}
