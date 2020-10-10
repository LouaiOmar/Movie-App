//
//  CelebImageAndBio.swift
//  Movie App
//
//  Created by Louai on 9/7/20.
//  Copyright © 2020 Louai. All rights reserved.
//

import Foundation

class CelebImageAndBio: SuperClass {
    
    var delegate: UpdateMovies?
    var celebdetails: CelebImageAndBioData?
       

       override func performRequest(with upcomingURL: String) {
               super.performRequest(with: upcomingURL)
       }


    override func parseJSON(_ upcomingData: Data) {
               let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode(CelebImageAndBioData.self, from: upcomingData)
                        DispatchQueue.main.async{
                            self.celebdetails = decodeData
                            self.delegate?.updateUI()
                            
                        }
                    } catch {
                        print(error)
                    }       }



}
