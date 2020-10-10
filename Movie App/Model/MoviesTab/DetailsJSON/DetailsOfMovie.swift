//
//  DetailsOfMovie.swift
//  Movie App
//
//  Created by Louai on 9/3/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import Foundation


class DetailsOfMovie: SuperClass {
    
//     var delegate: UpdateUIDetails?
    var delegate: UpdateMovies?
    var details: DetailsResult?
       

       override func performRequest(with upcomingURL: String) {
               super.performRequest(with: upcomingURL)
       }

       override func parseJSON(_ upcomingData: Data) {
           let decoder = JSONDecoder()
                do {
                    let decodeData = try decoder.decode(DetailsResult.self, from: upcomingData)
                    DispatchQueue.main.async{
                        self.details = decodeData
//                        self.delegate?.updateUIForDetails()
                        self.delegate?.updateUI()
                        
                    }
                } catch {
                    print(error)
                }       }
    
      
}
