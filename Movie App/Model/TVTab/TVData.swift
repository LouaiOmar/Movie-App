//
//  TVData.swift
//  Movie App
//
//  Created by Louai on 9/9/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import Foundation

struct TVArrayData: Codable {
    
    var results: [TVData]
}

struct TVData: Codable {
    var poster_path: String?
    var name: String
    var id: Int
    var vote_average: Float
    var overview: String

}
