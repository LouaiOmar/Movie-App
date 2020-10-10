//
//  PopularTV.swift
//  Movie App
//
//  Created by Louai on 9/9/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import Foundation

class PopularTV: SuperClass{
    
    
    var delegate: UpdateMovies?
    var photos: [TVData] = []
    

    override func performRequest(with upcomingURL: String) {
            super.performRequest(with: upcomingURL)
    }

    override func parseJSON(_ upcomingData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(TVArrayData.self, from: upcomingData)
            DispatchQueue.main.async{
                self.photos = decodeData.results
                self.photos = self.photos.filter{ $0.poster_path != nil }
                self.delegate?.updateUI()  }
            
        } catch {
            print(error)
        }    }
 
    
    


}
