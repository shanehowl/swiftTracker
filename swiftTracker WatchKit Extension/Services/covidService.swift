//
//  covidService.swift
//  swiftTracker WatchKit Extension
//
//  Created by ho.wai.loon on 01/08/2020.
//  Copyright © 2020 ho.wai.loon. All rights reserved.
//

import Foundation

class CovidService {
    func getStatisticsByCountry(city:String, completion:@escaping(CovidResponseLatest?) -> ()){
        // TODO
        // Creating the URL with the API we want to call
        // Create & start networking task to call the API
        // Handle the result return from API
        let apiURL = "https://api.apify.com/v2/key-value-stores/6t65lJVfs3d8s6aKc/records/LATEST?disableRedirect=true"
        
        guard let url = URL(string:apiURL) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){data,response,error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let covidResponse = try? JSONDecoder().decode(CovidResponseLatest.self, from:data)
            if let covidResponse = covidResponse {
                let covid = covidResponse
                completion(covid)
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
