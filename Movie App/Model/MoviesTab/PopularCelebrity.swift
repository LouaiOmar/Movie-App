//
//  PopularCelebrity.swift
//  Movie App
//
//  Created by Louai on 8/28/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import Foundation


class PopularCelebrity {
  
        var celebrityPhotos = [Celebrity]()
        var delegate: UpdateMovies?
    
    func performRequest(with upcomingURL: String) {
    let url = URL(string: upcomingURL)
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url!) { (data, response, error) in
    if error != nil {
        print(error!)
        return
    }
        self.parseJSON(data!)
    }
    task.resume()
        
    }

    func parseJSON(_ upcomingData: Data) {
    let decoder = JSONDecoder()
           do {
               let decodeData = try decoder.decode(CelebrityData.self, from: upcomingData)
               DispatchQueue.main.async{
                   self.celebrityPhotos = decodeData.results
                   self.delegate?.updateUI()  }
               
           } catch {
               print(error)
           }
    
    }

  
}
