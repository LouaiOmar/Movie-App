//
//  CelebAppearsIn.swift
//  Movie App
//
//  Created by Louai on 9/8/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import Foundation

class CelebAppearsInJSON: SuperClass {
    
    var delegate: UpdateMovies?
    var posters: [Results] = []
       

       override func performRequest(with upcomingURL: String) {
               super.performRequest(with: upcomingURL)
       }


    override func parseJSON(_ upcomingData: Data) {
               let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode(celebAppearsIn.self, from: upcomingData)
                        DispatchQueue.main.async{
                            self.posters = decodeData.cast
                            self.posters = self.posters.filter{ $0.poster_path != nil }
                            self.delegate?.updateUI()
                            
                        }
                    } catch {
                        print(error)
                    }       }



}
