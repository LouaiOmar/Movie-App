//
//  YoutubeLink.swift
//  Movie App
//
//  Created by Louai on 9/4/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import Foundation

class YoutubeLink: SuperClass {
    
    var videos: YouTubeVideos?
       var delegate: UpdateMovies?


       override func performRequest(with upcomingURL: String) {
               super.performRequest(with: upcomingURL)
       }

       override func parseJSON(_ upcomingData: Data) {
           let decoder = JSONDecoder()
                do {
                    let decodeData = try decoder.decode(VideoResults.self, from: upcomingData)
                    DispatchQueue.main.async{
                        if decodeData.results.count != 0 {
                            self.videos = decodeData.results[0]
                            self.delegate?.updateUI()
                        }
                    }
                } catch {
                    print(error)
                }       }
    
      
}
